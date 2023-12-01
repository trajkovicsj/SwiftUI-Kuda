//
//  EventResponse.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 8.11.23..
//

import Foundation

struct EventResponse: Decodable {
    let result: EventResult
    let version: String
    let message: String
}

struct EventResult: Decodable {
    let items: [Event]
    let totalPagesCount: Int
    let totalItemsCount: Int
}
