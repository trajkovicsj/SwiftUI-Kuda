//
//  NotificationResponse.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.12.23..
//

import Foundation

struct NotificationResponse: Decodable {
    let result: NotificationResult
    let version: String
    let message: String
}

struct NotificationResult: Decodable {
    let items: [Notification]
    let totalPagesCount: Int
    let totalItemsCount: Int
}
