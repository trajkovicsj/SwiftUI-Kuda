//
//  ForgotPasswordScreen.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 3.11.23..
//

import SwiftUI

struct ForgotPasswordScreen: View {
    let item: BasicItem
    
    var body: some View {
        VStack(spacing: 24) {
            Image(item.image)
            
            VStack(spacing: 8) {
                if !item.title.isEmpty {
                    Text(item.title)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                if !item.subtitle.isEmpty {
                    Text(item.subtitle)
                        .foregroundColor(.white.opacity(0.48))
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                }
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Vrati se nazad na prijavu")
                        .font(.system(size: 15))
                        .foregroundStyle(.black)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .border(.white)
                .cornerRadius(4)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        let item = InfoItem(image: "icon", title: "Uspešno resetovanje lozinke!", subtitle: "Na mejl adresu smo vam poslali link na kojem mozete uneti novu lozinku.")
        ForgotPasswordScreen(item: item)
            .background(.primaryBackground)
    }
}
