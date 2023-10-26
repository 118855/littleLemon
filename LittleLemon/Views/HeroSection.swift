//
//  HeroSection.swift
//  LittleLemon
//
//  Created by Maryna Poliakova-Bilous on 20.10.2023.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(verbatim: "Little Lemon")
                    .foregroundColor(Color("lemonYellow"))
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                
                Text(verbatim: "Chicago")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.leading)
                
                HStack{
                    Text(verbatim: "We are a family owned Mediterranean restaurant? focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                        .font(.callout)
                        .padding(.leading)
                    Image("heroImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(15)
                        .padding(.trailing)
                }
                .frame(width: geometry.self.size.width)
            }
            .padding()
            .background(Color("deepGreen"))
        }
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}
