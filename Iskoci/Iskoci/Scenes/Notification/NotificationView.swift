//
//  NotificationModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct NotificationView: View {
    @State var notificationModel = NotificationViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(title: notificationModel.title)
            if notificationModel.notifications.isEmpty {
                initialState
            }
            else {
                notificationList
            }
        }
        .onTapGesture {
            
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.tabBarBackground, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .background(.primaryBackground)
    }
    
    
    private var initialState: some View {
        NotificationScreen(item: notificationModel.initialState)
    }
    
    private var notificationList: some View {
        NotificationList(notifications: notificationModel.notifications)
            .padding(.top, 21)
    }
}

#Preview {
    NotificationView()
}
