//
//  DetailedEventView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 16.10.23..
//

import SwiftUI

struct DetailedEventView: View {
    @Binding var event: Event
    
    var onFavorite: (Event) -> () = { _ in }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(event.picture)
                titleItem
                Group {
                    calendarItem
                    locationItem
                    payItem
                    Divider().background(.white)
                    details
                    Divider().background(.white)
                    locationDetails
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button(action: {
                            onFavorite(event)
                        }){
                            event.isFavorite ? Image("full-heart-icon") : Image("heart-icon")
                        }
                        ShareLink(item: event.link) {
                            Image("share-icon")
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.tabBarBackground, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(.hidden, for: .tabBar)
        .background(.primaryBackground)
    }
    
    private var titleItem: some View {
        Text(event.name)
            .font(.system(size: 34, weight: .bold))
            .foregroundStyle(.white)
            .padding(16)
    }
    
    private var calendarItem: some View {
        InfoView(item: event.calendarItem)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
    }
    
    private var locationItem: some View {
        InfoView(item: event.locationItem)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
    }
    
    private var payItem: some View {
        InfoView(item: event.payItem)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
        
    }
    
    private var details: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Opis dogadjaja")
                .padding()
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Text(event.description)
                .font(.system(size: 15))
                .foregroundStyle(.white)
                .padding()
            Button(action: {}) {
                Text("Saznaj više ->")
                    .foregroundStyle(.tabBarForeground)
                    .padding()
            }
        }
    }
    
    private var locationDetails: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Lokacija")
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .padding()
            MapView(event: event)
                .frame(height: 192)
                .padding()
        }
    }
}

#Preview {
    let event = Event(id: 1, picture: "event-poster", name: "DOWNHILL Festival II", description: "Kancelarija za mlade pod pokroviteljstvom Grada Vranja organizuje drugi po redu DOWNHILL festival u subotu 09.09.2023. godine u atrijumskom delu sale Okce sa početkom od 20h na kome će nastupiti 4 renomirana benda, koji su se proslavili u žanru southern/stoner/sludge/metal/rock.", timestamp: 0, streetName: "Dusanova 24", placeName: "Niski kulturni centar", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.rs")
    
    return DetailedEventView(event: Binding.constant(event)).background(.primaryBackground)
    
}
