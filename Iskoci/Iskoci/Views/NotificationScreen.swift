//
//  NotificationScreen.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct NotificationScreen: View {
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

#Preview {
    let item = InfoItem(image: "notification-bell", title: "Nemate novih obaveštenja", subtitle: "Ukljucite obaveštenja u opcijama kako bi ste bili u toku sa najnovijim dešavanjima.")
    return NotificationScreen(item: item)
        .background(.primaryBackground)
}
