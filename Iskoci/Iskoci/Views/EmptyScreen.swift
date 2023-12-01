//
//  EmptyScreen.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 23.10.23..
//

import SwiftUI

struct EmptyScreen: View {
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}

struct EmptyScreen_Previews: PreviewProvider {
    static var previews: some View {
        let item = InfoItem(image: "notification-bell", title: "", subtitle: "Uključite obaveštenja u opcijama kako biste bili u toku sa najnovijim dešavanjima.")
        EmptyScreen(item: item)
            .background(.primaryBackground)
    }
}
