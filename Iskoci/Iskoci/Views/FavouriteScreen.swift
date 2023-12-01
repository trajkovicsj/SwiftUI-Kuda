//
//  FavouriteView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct FavouriteScreen: View {
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
    let item = InfoItem(image: "empty-favorites", title: "Nemate omiljenih dogadjaja", subtitle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
    return FavouriteScreen(item: item)
        .background(.primaryBackground)
}
