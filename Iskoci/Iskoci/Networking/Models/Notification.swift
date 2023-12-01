//
//  Notification.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct Notification: Identifiable, Hashable, Decodable {
    let id: Int
    let eventId: Int?
    let picture: String
    let title: String?
    let created: Double
    let read: Bool
    var link: String = ""
    
    var hasURL: Bool { true }
    var subtitle: String {
        hasURL ? "Izdvajamo" : "Objavljen novi dogadjaj"
    }
    
    var time: String {
        let date = Date(timeIntervalSince1970: created)
        let currentTime = date.currentTimeString
        return currentTime
    }
}
