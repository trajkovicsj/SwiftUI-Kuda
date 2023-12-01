//
//  NotificationViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import Foundation
import Alamofire

@Observable
final class NotificationViewModel {
    
    init() {
        getNotifications()
    }
    
    let initialState = InfoItem(image: "notification-bell", title: "Nemate novih obaveštenja", subtitle: "Uključite obaveštenja u opcijama kako bi ste bili u toku sa najnovijim dešavanjima.")
    let title = "Obaveštenja"
    
    private var currentPage = 1
    private let numberOfItems = 7
    private var totalPageNumber = 0
    private var totalItemsCount = 0
    
    var notifications = [Notification]()
    
    var headers: HTTPHeaders {
        ["DeviceId": "123456" ]
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numberOfItems, Params.page.rawValue: currentPage]
    }
    
    func getNotifications() {
        UserService.getNotifications(method: .get, header: headers, parameters: params) {[weak self] eventResponse in
            guard case .success(let response) = eventResponse else { return }
            self?.notifications += response.result.items
            self?.totalPageNumber = response.result.totalPagesCount
            self?.totalItemsCount = response.result.totalItemsCount
        }
    }
    
    //        func getEventById(eventId: String) {
    //            EventService.getEventById(method: .get, header: headers, url: Urls.event(eventId).urlString) {[weak self] response in
    //                guard case .success = response else { return }
    //        }
    //    }
}
