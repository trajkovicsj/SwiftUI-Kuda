//
//  SlidingSelectable.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import SwiftUI

struct SlidingSelectable: SelectableItem {
    
    let id =  UUID()
    
    let title: String
    
    var isSelected = false
    
    var type: SelectableSearch
    
    var backgroundColor: Color {
        isSelected ? .infoSelected : .infoBackground
    }
    
    var foregroundColor: Color {
        isSelected ? .infoForeground : .white
    }
    
    
}
