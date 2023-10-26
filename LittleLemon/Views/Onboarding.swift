//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var shouldNavigate = false
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $shouldNavigate) {
                    EmptyView()
                }
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 35, alignment: .center)
                Spacer(minLength: 10)
                HeroSection()
                Spacer(minLength: 80)
                VStack(alignment: .leading) {
                    Text("Name*")
                    TextField(
                        "Name",
                        text: $name
                    )
                    .disableAutocorrection(true)
                    .frame(height: 35)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Last Name*")
                    TextField(
                        "Last name",
                        text: $lastName
                    )
                    .disableAutocorrection(true)
                    .frame(height: 35)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Email*")
                    TextField(
                        "Email",
                        text: $email
                    )
                    .disableAutocorrection(true)
                    .frame(height: 35)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 10)
                GeometryReader { geometry in
                    Button {
                        if !name.isEmpty && !email.isEmpty {
                            userManager.logIn(name: name, lastName: lastName, email: email)
                        } else {
                        }
                    } label: {
                        Text("Register")
                            .frame(width: geometry.size.width - 30)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("lemonYellow"))
                            .cornerRadius(10)
                    }
                }
                .padding(10)
            }
            .onReceive(userManager.$isLoggedIn) { isLoggedIn in
                shouldNavigate = isLoggedIn
            }
        }
        // .navigationBarBackButtonHidden(true)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
