//
//  FavouriteViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI
import Alamofire

@Observable
final class FavouriteViewModel {
    
    let noResults = InfoItem(image: "empty-favorites", title: "Nemate omiljenih dogadjaja", subtitle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
    
    let title = "Omiljeni"
    
    var events = [Event]()
    var removeFavorite: (Event) -> () = {_ in}
    
    init() {
        fetchEvents()
    }
    
    func handleFavorite(_ event: Event) {
        if !event.isFavorite {
            addToFavorite(event: event)
        }
        else {
            removeFromFavorite(event: event)
        }
    }
    
    var headers: HTTPHeaders {
        ["DeviceId": "123456" ]
    }
    private var currentPage = 1
    private let numberOfItems = 7
    private var totalPageNumber = 0
    
    func addToFavorite(event: Event) {
        UserService.addToFavorites(method: .post, header: headers, url: Urls.favorite(event.id).urlString) {[weak self] response in
            guard case .success = response else { return }
            self?.setIsFavorite(true, to: event)
        }
    }
    
    func removeFromFavorite(event: Event) {
        UserService.removeFromFavorites(method: .delete, header: headers, url: Urls.favorite(event.id).urlString) {[weak self] response in
            guard case .success = response else { return }
            guard let index = self?.events.firstIndex(of: event) else { return }
            self?.events.remove(at: index)
            self?.removeFavorite(event)
            self?.setIsFavorite(false, to: event)
        }
    }
    
    func setIsFavorite(_ isFavorite: Bool, to event: Event) {
        guard let index = events.firstIndex(of: event) else { return }
        events[index].isFavorite = isFavorite
    }
    
    func fetchEvents() {
        EventService.getFavorites(method: .get, header: headers, parameters: params) {[weak self] eventResponse in
            guard let self else { return }
            guard case .success(let response) = eventResponse else {
                return
            }
            events = response.result.items
        }
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numberOfItems, Params.page.rawValue: currentPage]
    }
}

