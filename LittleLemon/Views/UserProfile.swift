//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 25.10.2023.
//

import SwiftUI

struct UserProfile: View {
    @State private var firstName = UserDefaults.standard.string(forKey: kName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: "Personal information")
                .font(.title2)
                .bold()
            Text(verbatim: "Avatar")
                .font(.footnote)
                .padding(.top, 10)
            HStack(alignment: .center) {
                Image("profileImagePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Button {
                    print("Will be avialable soon")
                } label: {
                    Text("Change")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("deepGreen"))
                        .cornerRadius(10)
                }
                Button {
                    print("Will be avialable soon")
                } label: {
                    Text("Remove")
                        .padding()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .border(Color("deepGreen"))
            }
            .padding(.bottom, 20)
            
            Text("First name")
            TextField(
                "Name",
                text: $firstName
            )
            .disableAutocorrection(true)
            .frame(height: 35)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Last Name")
            TextField(
                "Last name",
                text: $lastName
            )
            .disableAutocorrection(true)
            .frame(height: 35)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Email")
            TextField(
                "Email",
                text: $email
            )
            .disableAutocorrection(true)
            .frame(height: 35)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding(15)
        
        VStack(alignment: .center) {
            GeometryReader { geometry in
                Button {
                    userManager.logOut()
                }
            label: {
                Text("Log out")
                    .frame(width: geometry.size.width - 30)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color("lemonYellow"))
                    .cornerRadius(10)
            }
            }
            HStack (alignment: .center, content: {
                Button {
                    update()
                } label: {
                    Text("Discard changes")
                        .padding()
                        .foregroundColor(Color("deepGreen"))
                        .cornerRadius(10)

                }
                .cornerRadius(10)
                .border(Color("deepGreen"))
                
                Button {
                    userManager.changeData(name: firstName, lastName: lastName, email: email)
                } label: {
                    Text("Save changes")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("deepGreen"))
                        .cornerRadius(10)
                }
            })
       }
        .onAppear(){
            update()
        }
        .padding(15)
    }
    
    func update() {
        firstName = UserDefaults.standard.string(forKey: kName) ?? ""
        lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
        email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    }
    
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
