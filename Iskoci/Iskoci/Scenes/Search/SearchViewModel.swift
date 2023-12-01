//
//  SearchViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import Foundation
import UIKit
import Alamofire

@Observable
final class SearchViewModel {
    
    let initialItem = InfoItem(image: "magnifier", title: "", subtitle: "Ukucaj termin u polje za pretragu kako bi pronašao dogadjaj koji bi posetio.")
    
    let noResult = InfoItem(image: "magnifier", title: "Nema rezultata", subtitle: "Promeni termin pretrage pa probaj ponovo.")
    
    var events: [Event] = [] {
        didSet {
            isInitialState = false
        }
    }
    
    var searchText: String = "" {
        didSet {
            updateSearchResults()
        }
    }
    
    var searchTimer: Timer?
    
    var selectables = SelectableSearch.allSelectables
    var selected: SlidingSelectable? = nil {
        didSet {
            print(selected?.title ?? "")
            fetchEvents()
        }
    }
    
    var isInitialState = true
    
    private var currentPage = 1
    private let numberOfItems = 7
    private var totalPageNumber = 0
    
    var headers: HTTPHeaders {
        ["DeviceId": "123456" ]
    }
    
    func fetchEvents() {
        EventService.selectableSearchRequest(method: .get, header: headers, parameters: params) {[weak self] eventResponse in
            guard case .success(let response) = eventResponse else { return }
            self?.events = response.result.items
            self?.totalPageNumber = response.result.totalPagesCount
        }
    }
    
    var dateTime: String {
        guard selected != nil else { return "" }
        return DateFormatType.timeZoneFormat.string(from: Date())
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numberOfItems, Params.page.rawValue: currentPage, Params.dateTime.rawValue: dateTime , Params.dateShortcut.rawValue: selected?.type.value ?? "", Params.searchTerm.rawValue: searchText]
    }
    
    func getNextPage() async {
        guard totalPageNumber > currentPage else { return }
        currentPage += 1
        fetchEvents()
    }
    
    func updateSearchResults() {
        guard !searchText.isEmpty else { return events.removeAll() }
        self.searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] (timer) in
            self?.fetchEvents()
        })
    }
}
