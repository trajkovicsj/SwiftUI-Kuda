//
//  SelectableItem.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import SwiftUI

protocol SelectableItem: Equatable, Identifiable {
    var id: UUID { get }
    var title: String { get }
    var isSelected: Bool { get set}
    var backgroundColor: Color { get }
    var foregroundColor: Color { get }
}
