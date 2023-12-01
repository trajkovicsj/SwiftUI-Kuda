//
//  EventList.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 23.10.23..
//

import SwiftUI

struct EventList: View {
    @Binding var events: [Event]
    var threshold = 2
    
    var onEndOfList: () -> () = {}
    var onFavorite: (Event) -> () = { _ in }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24){
                ForEach($events) { $event in
                    NavigationLink(destination: DetailedEventView(event: $event, onFavorite: onFavorite)){
                        EventView(event: event, onFavorite: onFavorite)
                            .padding(.horizontal, 16)
                            .frame(height: 124)
                            .onAppear {
                                checkEndOfList(for: event)
                            }
                    }
                    .navigationTitle("Nazad")
                }
            }
        }
    }
    
    private func checkEndOfList(for event: Event) {
        guard !events.isEmpty else { return }
        let index = events.firstIndex(of: event) ?? 0
        if events.count <= index + threshold {
            onEndOfList()
        }
    }
}

//#Preview {
//    let list = [Event(id: 1, picture: "event-poster", name: "DOWNHILL Festival II asda sdasd asD AD", description: "dlaksjfghalkdsf", timestamp: 1690923600, streetName: "Dušanova 24", placeName: "Niski kulturni centar", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.rs")]
//
//    return EventList(events: list)
//        .background(.primaryBackground)
//}
