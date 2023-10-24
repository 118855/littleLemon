//
//  Menu.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct Menu: View {
    @State private var searchText: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Header()
            Spacer(minLength: 10)
            HeroSection()
            TextField("Search menu", text: $searchText)
                .frame(height: 35)
                .textFieldStyle(.roundedBorder)
                .padding(30)
                .background(Color("deepGreen"))
            FetchedObjects( predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            NavigationLink(destination: DetailDish(dish: dish)) {
                                EmptyView()
                            }
                            
                            VStack (alignment: .leading, spacing: 5) {
                                Text(dish.title ?? "Dish")
                                    .font(.system(size: 20, weight: .semibold))
                                Text(dish.text ?? "")
                                    .font(.callout)
                                    .foregroundColor(Color("deepGreen"))
                                
                                Text("$\(dish.price ?? "0")")
                                    .bold()
                                    .foregroundColor(Color("deepGreen"))
                            }
                        }
                    }
                }
                .foregroundColor(Color.blue)
            }
        }
        .onAppear() {
            getMenuData()
        }
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
                                    dish.title = item.title
                                    dish.image = item.image
                                    dish.price = item.price
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
          return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
