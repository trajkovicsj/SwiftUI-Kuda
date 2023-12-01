//
//  SortingOrder.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 11.10.23..
//

import Foundation

enum SortingOrder: CaseIterable {
	case mostRecent
	case oldest
	
	var title: String {
		switch self {
		case .mostRecent:
			return "Najskorije"
		case .oldest:
			return "Najkasnije"
		}
	}
    
    var value: String {
        switch self {
        case .mostRecent:
            return "mostRecent"
        case .oldest:
            return "theOldest"
        }
    }
}
