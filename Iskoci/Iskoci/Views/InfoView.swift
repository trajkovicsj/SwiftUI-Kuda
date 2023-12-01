//
//  InfoView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 16.10.23..
//

import SwiftUI

struct InfoView: View {
    let item: BasicItem
    
    var body: some View {
        HStack(spacing: 8) {
            Image(item.image)
                .background(.infoBackground)
                .cornerRadius(8)
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(item.subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.eventFooter)
            }
        }
    }
}

#Preview {
    let item = InfoItem(image: "location-icon", title: "OKCE, Vranje", subtitle: "Kralja milana 34")
    
    return InfoView(item: item).background(.primaryBackground)
}
