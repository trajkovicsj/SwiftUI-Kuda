//
//  EventView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 11.10.23..
//

import SwiftUI

struct EventView: View {
    let event: Event
    var onFavorite: (Event) -> () = {_ in}
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: event.picture)) {
                image in image.resizable()
            }
        placeholder: {
            //Image("pin")
            ProgressView()
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: 114, height: 114)
        .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 0) {
                headerView
                titleView
                footer
            }
        }
        .frame(height: 124)
        .background(.primaryBackground)
    }
    
    // MARK: - Properties
    
    private var footer: some View {
        HStack(spacing: 0){
            locationView
            Spacer()
            menuButtons
        }
    }
    
    private var headerView: some View {
        Text(event.startTime)
            .foregroundStyle(.eventHeader)
            .font(.system(size: 15, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var titleView: some View {
        Text(event.name)
            .frame(height: 56, alignment: .topLeading)
            .foregroundStyle(.white)
            .font(.system(size: 22, weight: .semibold))
            .padding(.top, 8)
            .padding(.bottom, 13)
            .multilineTextAlignment(.leading)
    }
    
    private var locationView: some View {
        HStack(spacing: 8) {
            Image("pin")
            Text(event.placeName)
                .foregroundStyle(.eventFooter)
                .font(.system(size: 13, weight: .medium))
                .lineLimit(1)
        }
    }
    
    private var menuButtons: some View {
        HStack(spacing: 8) {
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

#Preview {
    let event = Event(id: 1, picture: "event-image", name: "DOWNHILL Festival II asda sdasd asD AD", description: "", timestamp: 1690923600, streetName: "", placeName: "Niski kulturni centar", latitude: 0.0, longitude: 0.0, price: 0, link: "")
    
    return EventView(event: event)
}
