//
//  EventType .swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import Foundation

enum EventType: CaseIterable {
	case all
	case upcoming
	case finished
	
	var title: String {
		switch self {
		case .all:
			return "Svi"
		case .upcoming:
			return "Predstojeći"
		case .finished:
			return "Završeni"
		}
	}
    
    var value: String {
        switch self {
        case .all:
            return ""
        case .upcoming:
            return "upcoming"
        case .finished:
            return "done"
        }
    }
}
