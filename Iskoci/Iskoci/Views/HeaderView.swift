//
//  HeaderView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct HeaderView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 3, leading: 16, bottom: 8, trailing: 0))
            .foregroundStyle(.white)
            .font(.system(size: 34, weight: .bold))
            .background(.tabBarBackground)
    }
}

#Preview {
    HeaderView(title: "")
}
