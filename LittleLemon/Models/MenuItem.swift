//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id: Int64
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case image
        case category
    }
}
