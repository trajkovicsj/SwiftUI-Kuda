//
//  Urls.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 8.11.23..
//

import Foundation


enum Urls {
    case base
    case events
    case event(String)
    case search
    case user
    case favorite(Int)
    case favorites
    case notifications
    
    var urlString: String {
        switch self {
            
        case .base:
            return "https://api.kuda-vr.xyz"
        case .events:
            return "\(Urls.base.urlString)/api/event"
        case .search:
            return "\(Urls.base.urlString)/api/event/name"
        case .user:
            return "\(Urls.base.urlString)/api/user/deviceid"
        case .favorite(let id):
            return "\(Urls.base.urlString)/api/user/\(id)"
        case .favorites:
            return "\(Urls.base.urlString)/api/user/favorites"
        case .event(let id):
            return "\(Urls.base.urlString)/api/event/\(id)"
        case .notifications:
            return "\(Urls.base.urlString)/api/user/notifications"
        }
    }

}
