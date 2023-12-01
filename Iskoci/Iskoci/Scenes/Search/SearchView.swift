//
//  SearchView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import SwiftUI

struct SearchView: View {
    
    @State var searchModel = SearchViewModel()
    
    var body: some View {
        NavigationBar {
            VStack {
                slidingSelector
                content
                    .frame(maxHeight: .infinity)
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.tabBarBackground, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .background(.primaryBackground)
        }
        .searchable(text: $searchModel.searchText)
    }
    
    private var emptyList: some View {
        EventList(events: $searchModel.events, onEndOfList: {
            Task {await searchModel.getNextPage()}
        })
    }
    
    
    private var emptyScreen: some View {
        EmptyScreen(item: searchModel.initialItem)
    }
    
    private var noSearchResultsScreen: some View {
        EmptyScreen(item: searchModel.noResult)
    }
    
    // MARK: - Properties
    
    private var slidingSelector: some View {
        SelectableSlider<SlidingSelectable>(selectables: $searchModel.selectables, selected:
                                                $searchModel.selected)
    }
    
    @ViewBuilder private var content: some View {
        if searchModel.isInitialState || searchModel.searchText.isEmpty {
            emptyScreen
        }
        else if searchModel.events.isEmpty {
            noSearchResultsScreen
        }
        else {
            emptyList
        }
    }
}

#Preview {
    SearchView()
}
