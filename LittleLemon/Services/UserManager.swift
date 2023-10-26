//
//  UserManager.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import Foundation

let kName = "name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"
let kImage = "kImage"

class UserManager: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: kIsLoggedIn)

    func logOut() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        isLoggedIn = false
    }

    func logIn(name: String, lastName: String, email: String) {
        UserDefaults.standard.set(name, forKey: kName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        isLoggedIn = true
    }
    
    func changeData(name: String, lastName: String, email: String) {
        UserDefaults.standard.set(name, forKey: kName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
    }
    
    func changeAvatar(image: String) {
        UserDefaults.standard.set(image, forKey: kImage)
    }
    func removeAvatar() {
        UserDefaults.standard.set("", forKey: kImage)
    }
}
