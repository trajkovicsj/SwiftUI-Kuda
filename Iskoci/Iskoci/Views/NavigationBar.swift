//
//  NavigationBar.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import SwiftUI

struct NavigationBar<T: View>: View {
    let content: () -> T
    
    var body: some View {
        NavigationStack {
            content()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("iskoci")
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: NotificationView()) {
                            Image("bell")
                        }
                    }
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.tabBarBackground, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationBar {
        Text("")
    }
}
