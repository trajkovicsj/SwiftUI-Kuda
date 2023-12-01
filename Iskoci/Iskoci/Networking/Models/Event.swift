//
//  Event.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 11.10.23..
//

import Foundation
import CoreLocation

struct Event: Identifiable, Hashable, Decodable {
    let id: Int
    let picture: String
    let name: String
    let description: String
    let timestamp: Double
    let streetName: String
    let placeName: String
    let latitude: Double
    let longitude: Double
    let price: Int
    let link: String
    var isFavorite = false
    
    var startTime: String {
        let date = Date(timeIntervalSince1970: timestamp)
        let serbianDate = DateFormatType.serbianDate.string(from: date)
        let serbianTime = DateFormatType.serbianTime.string(from: date)
        
        return "\(serbianDate.capitalized) u \(serbianTime)h"
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var calendarItem: BasicItem {
        let date = Date(timeIntervalSince1970: timestamp)
        let serbianDate = DateFormatType.serbianDate.string(from: date)
        let basicDateTime = DateFormatType.basicDateTime.string(from: date)
        
        return InfoItem(image: "calendar-icon", title: serbianDate.capitalized, subtitle: "\(basicDateTime)h")
    }
    
    var locationItem: BasicItem {
        InfoItem(image: "location-icon", title: placeName, subtitle: streetName)
    }
    
    var payItem: BasicItem {
        let isFree = price > 0 ? "je" : "nije"
        return InfoItem(image: "pay-icon", title: "Cena ulaznice je \(price)RSD", subtitle: "Za ulazak \(isFree) potreban karta")
    }
    
    // MARK: - Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
