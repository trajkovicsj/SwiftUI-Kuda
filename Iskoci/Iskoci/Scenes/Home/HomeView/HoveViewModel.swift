//
//  HoveViewModel.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import Foundation
import Alamofire

@Observable
final class HomeViewModel {
    
    // MARK: - Init
    
    init() {
        fetchEvents()
        
    }
    
    var onFavoriteChanged: ()->() = { }
    
    // MARK: - Wrappers
    
    var selectedOrderType = SortingOrder.mostRecent {
        didSet {
            currentPage = 1
            events.removeAll()
            fetchEvents()
        }
    }
    var selectedEventsType = EventType.all {
        didSet {
            currentPage = 1
            events.removeAll()
            fetchEvents()
        }
    }
    
    // MARK: - Properties
    
    let title = "Kude s’d \nće iskočiš? 🤔"
    var events = [Event]()
    var selectedEvent: Event!
    
    private var currentPage = 1
    private let numberOfItems = 7
    private var totalPageNumber = 0
    
    
    private var eventsModel = HomeEventsModel()
    
    func handleFavorite(_ event: Event) {
        if !event.isFavorite {
            addToFavorite(event: event)
        }
        else {
            removeFromFavorite(event: event)
        }
    }
    
    func fetchEvents() {
        EventService.getEvents(method: .get, header: headers, parameters: params) {[weak self] eventResponse in
            guard case .success(let response) = eventResponse else { return }
            self?.events += response.result.items
            self?.totalPageNumber = response.result.totalPagesCount
        }
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numberOfItems, Params.page.rawValue: currentPage, Params.dateTime.rawValue: DateFormatType.timeZoneFormat.string(from: Date()), Params.dateOrder.rawValue: selectedOrderType.value, Params.type.rawValue: selectedEventsType.value]
    }
    
    func getNextPage() async {
        guard totalPageNumber > currentPage else { return }
        currentPage += 1
        fetchEvents()
    }
    
    var headers: HTTPHeaders {
        ["DeviceId": "123456" ]
    }
    
    func addToFavorite(event: Event) {
        UserService.addToFavorites(method: .post, header: headers, url: Urls.favorite(event.id).urlString) {[weak self] response in
            guard case .success = response else { return }
            self?.setIsFavorite(true, to: event)
        }
    }
    
    func removeFromFavorite(event: Event) {
        UserService.removeFromFavorites(method: .delete, header: headers, url: Urls.favorite(event.id).urlString) {[weak self] response in
            guard case .success = response else { return }
            self?.setIsFavorite(false, to: event)
        }
    }
    
    func setIsFavorite(_ isFavorite: Bool, to event: Event) {
        guard let index = events.firstIndex(of: event) else { return }
        events[index].isFavorite = isFavorite
    }
}
