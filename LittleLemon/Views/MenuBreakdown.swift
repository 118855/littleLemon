//
//  MenuBreakdown.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 26.10.2023.
//

import SwiftUI

struct MenuBreakdown: View {
    var dishes: [Dish]
    var categorySelected: (String?) -> Void

    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(verbatim: "ORDER FOR DELIVERY!")
                .bold()
                .padding(.bottom ,15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    Button(action: {
                        self.categorySelected("all")
                    }) {
                        Text("All")
                            .padding(10)
                            .bold()
                            .background(Color("lightGrey"))
                            .foregroundColor(Color("deepGreen"))
                            .cornerRadius(15)
                    }
                    
                    ForEach(dishes) { dish in
                        if !dishes.prefix(while: { $0.id != dish.id }).contains(where: { $0.category == dish.category }) {
                            

                            Button(action: {
                                self.categorySelected(dish.category)
                            }) {
                                Text(dish.category?.capitalizedFirst ?? "")
                                    .padding(10)
                                    .bold()
                                    .background(Color("lightGrey"))
                                    .foregroundColor(Color("deepGreen"))
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
            }
            VStack() { Divider().frame(height: 1).background(Color("lightGrey")) }
                .padding(.top, 20)
        }
        .padding(15)
    }
}

struct MenuBreakdown_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuBreakdown(dishes: [Dish()], categorySelected: { category in
        })
    }
}

