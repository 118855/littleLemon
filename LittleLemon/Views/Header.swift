//
//  Header.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Spacer()
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 35, alignment: .center)
            Spacer()
            NavigationLink(destination: {
                UserProfile()
            }, label: {
                Image("profileImagePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 35, alignment: .trailing)
            })
            .padding(.trailing)
        }
        .frame(height: 35)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
