//
//  Notification.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct Notification: Identifiable, Hashable, Decodable {
    let id: Int
    let eventId: Int
    let picture: String
    let title: String
    let created: String
    let isReaded: Bool
    let link: String
    
    var hasURL: Bool { true }
    var subtitle: String {
        hasURL ? "Izdvajamo" : "Objavljen novi dogadjaj"
    }
    
    var time: String {
        guard let date = DateFormatType.serverFormat.date(from: created) else {
            return ""
        }
        let currentTime = date.currentTimeString
        return currentTime
    }
}
