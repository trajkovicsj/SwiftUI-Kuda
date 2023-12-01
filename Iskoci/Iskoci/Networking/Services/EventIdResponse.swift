//
//  NotificationResponse.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.12.23..
//

import Foundation

struct EventIdResponse: Decodable {
    let result: Event
    let version: String
    let message: String
}
