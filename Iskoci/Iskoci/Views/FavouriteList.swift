//
//  FavouriteList.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct FavouriteList: View {
    @Binding var events: [Event]
    var onFavorite: (Event) -> () = { _ in }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24){
                ForEach(events) { event in
                    NavigationLink(value: event) {
                        EventView(event: event, onFavorite: onFavorite)
                            .padding(.horizontal, 16)
                            .frame(height: 124)
                    }
                    .navigationTitle("Nazad")
                }
            }
            .padding(.top, 24)
        }
    }
}

//#Preview {
//    let list = [Event(id: 1, picture: "event-poster", name: "DOWNHILL Festival II asda sdasd asD AD", description: "dlaksjfghalkdsf", timestamp: 1690923600, streetName: "Dušanova 24", placeName: "Niski kulturni centar", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.rs")]
//    return FavouriteList(events: list).background(.primaryBackground)
//}
