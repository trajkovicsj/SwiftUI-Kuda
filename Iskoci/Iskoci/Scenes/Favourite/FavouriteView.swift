//
//  FavouriteView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct FavouriteView: View {
    @State var favouriteModel = FavouriteViewModel()
    
    var body: some View {
        NavigationBar {
            VStack {
                HeaderView(title: favouriteModel.title)
                content
            }
            .background(.primaryBackground)
            .onAppear{
                favouriteModel.fetchEvents()
            }
        }
    }
    
    private var noResultsScreen: some View {
        FavouriteScreen(item: favouriteModel.noResults)
    }
    
    private var favouritesList: some View {
        FavouriteList(events: $favouriteModel.events, onFavorite: {event in favouriteModel.removeFromFavorite(event: event)})
    }
    
    @ViewBuilder private var content: some View {
        if favouriteModel.events.isEmpty {
            noResultsScreen
        }
        else {
            favouritesList
        }
    }
}

#Preview {
    FavouriteView()
}
