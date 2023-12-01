//
//  SelectableSearch.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import Foundation

enum SelectableSearch: Hashable {
    case today
    case tomorrow
    case thisWeek
    case thisMonth
    
    static var allSelectables: [SlidingSelectable] {
        [SelectableSearch.today.slidingSelectable,
         SelectableSearch.tomorrow.slidingSelectable,
         SelectableSearch.thisWeek.slidingSelectable,
         SelectableSearch.thisMonth.slidingSelectable]
    }
    
    var slidingSelectable: SlidingSelectable {
        switch self {
            
        case .today:
            return SlidingSelectable(title: "Danas", type: .today)
        case .tomorrow:
            return SlidingSelectable(title: "Sutra", type: .tomorrow)
        case .thisWeek:
            return SlidingSelectable(title: "Ove nedelje", type: .thisWeek)
        case .thisMonth:
            return SlidingSelectable(title: "Ovog meseca", type: .thisMonth)
        }
    }
    
    var value: String {
        switch self {
        case .today:
            return "today"
        case .tomorrow:
            return "tomorrow"
        case .thisWeek:
            return "thisWeek"
        case .thisMonth:
            return "thisMonth"
        }
    }
}


