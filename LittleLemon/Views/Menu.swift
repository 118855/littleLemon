//
//  Menu.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct Menu: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String?
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack (spacing: 0) {
            Header()
            Spacer(minLength:10)
            VStack (spacing: 0) {
                HeroSection()
                    .frame(height: 250)
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(20)
                    .background(Color("deepGreen"))
                    .fixedSize(horizontal: false, vertical: true)
           }
            
            FetchedObjects { (dishes: [Dish]) in
                MenuBreakdown(dishes: dishes, categorySelected: { category in
                    self.selectedCategory = category
                })
            }
            
            FetchedObjects( predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(dish.title ?? "Dish")
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer(minLength: 5)
                                Text(dish.text ?? "")
                                    .font(.callout)
                                    .foregroundColor(Color("deepGreen"))
                                Spacer(minLength: 5)
                                Text("$\(dish.price ?? "0")")
                                    .bold()
                                    .foregroundColor(Color("deepGreen"))
                                    .padding(.bottom, 10)
                            }
                            .frame(width: 250)
                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fit)
                        }
                        .background(
                                   NavigationLink("", destination: DetailDish(dish: dish)).opacity(0)
                               )
                    }
                }
                .padding()
                .listStyle(.plain)
            }
        }
        .onAppear() {
            getMenuData()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func getMenuData() {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: request) { data, responce, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let menuData = try decoder.decode(MenuList.self, from: data)
                    
                    for item in menuData.menu {
                        let dish = Dish(context: viewContext)
                        dish.id = item.id
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                        dish.text = item.description
                    }
                    try? viewContext.save()
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if let category = selectedCategory {
            return category == "all" ? NSPredicate(value: true) : NSPredicate(format: "category == %@", category)
        } else {
            return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
