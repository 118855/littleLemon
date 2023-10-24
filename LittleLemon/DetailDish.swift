//
//  DetailDish.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct DetailDish: View {
    let dish: Dish

    var body: some View {
        Text(dish.title ?? "No dish")
    }
}

struct DetailDish_Previews: PreviewProvider {
    static var previews: some View {
        DetailDish(dish: Dish())
    }
}
