//
//  Date.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import Foundation

extension Date {
    
    var currentTimeString: String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return ("pre \(year) godine")
        }
        else if let month = interval.month, month > 0 {
            return month == 1 ? ("pre \(month) mesec") : ("pre \(month) meseca")
        }
        else if let day = interval.day, day > 0 {
            return day == 1 ? ("pre \(day) dan") : ("pre \(day) dana")
        }
        else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? ("pre \(hour) sat") : ("pre \(hour) sati")
        }
        else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? ("pre \(minute) minut") : ("pre \(minute) minuta")
        }
        return "malopre"
    }
}
