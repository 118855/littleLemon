//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let description: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case description
        case image
    }
}
