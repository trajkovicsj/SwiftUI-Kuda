//
//  DocumentsView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 30.10.23..
//

import SwiftUI

struct DocumentsView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image("trailing-arrow")
        }
    }
}

#Preview {
    DocumentsView(title: "Dokumenti")
}
