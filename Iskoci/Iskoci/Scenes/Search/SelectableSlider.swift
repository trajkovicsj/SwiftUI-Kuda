//
//  SelectableSlider.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 23.10.23..
//

import SwiftUI

struct SelectableSlider<T: SelectableItem>: View {
    @Binding var selectables: [T]
    @Binding var selected: T?
    
    var body: some View {
        VStack{
            ScrollView (.horizontal, showsIndicators: false){
                HStack(spacing: 16) {
                    ForEach(selectables) {
                        selectable  in
                        Button(action: {
                            selectItem(selectable)
                        }) {
                            Text(selectable.title)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                        }
                        .background(selectable.backgroundColor)
                        .cornerRadius(26)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(selectable.foregroundColor)
                        
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 24)
                .background(.primaryBackground)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func selectItem(_ selectable: T) {
        guard let index = selectables.firstIndex(of: selectable) else { return }
        
        guard !selectables[index].isSelected else {
            selectables[index].isSelected = false
            return
        }
        
        selectables.indices.forEach{ index in selectables[index].isSelected = false
        }
        
        selectables[index].isSelected = true
        
        
        selected = selectables[index]
    }
}


#Preview {
    SelectableSlider<SlidingSelectable>(selectables: Binding.constant(SelectableSearch.allSelectables), selected: Binding.constant(nil))
}
