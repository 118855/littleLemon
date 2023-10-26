//
//  Extentions.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 26.10.2023.
//

import Foundation

extension String {
    var capitalizedFirst: String {
        guard !isEmpty else { return "" }
        return prefix(1).capitalized + dropFirst()
    }
}
