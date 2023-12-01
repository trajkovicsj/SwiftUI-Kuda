//
//  HomeView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationBar {
            VStack(alignment: .leading, spacing: 0){
                HeaderView(title: viewModel.title)
                segmentPicker
                sortingMenu
                
                EventList(events: $viewModel.events,
                          onEndOfList: {
                    Task {await viewModel.getNextPage()}},
                          onFavorite: {event in
                    viewModel.handleFavorite(event)
                })
                .refreshable {
                    
                }
            }
            .background(.primaryBackground)
            .navigationTitle("Nazad")
        }
    }
    
    // MARK: - Propeties
    
    
    private var segmentPicker: some View {
        Picker("Selecting event category", selection: $viewModel.selectedEventsType) {
            ForEach(EventType.allCases, id: \.self) { eventType  in
                Text(eventType.title)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    private var sortingMenu: some View {
        Picker("Selecting sorting order", selection: $viewModel.selectedOrderType) {
            ForEach(SortingOrder.allCases, id: \.self) {sorting in
                Text(sorting.title)
            }
        }
        .padding(.trailing, 16)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    HomeView()
}
