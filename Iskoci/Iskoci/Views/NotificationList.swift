//
//  NotificationList.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct NotificationList: View {
    let notifications: [Notification]
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0){
                ForEach(notifications) { notification in
                    NavigationLink(value: notification) {
                        OneNotificationView(notification: notification)
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .background(.primaryBackground)
    }
}

//#Preview {
//    let notification = [Notification(id: 1, eventId: 1, picture: "notification-poster", title: "Prva Biciklijada u Vranju", created: "2023-11-01T15:00:00Z", isReaded: true, link: "")]
//   return NotificationList(notifications: notification)
//        .background(.primaryBackground)
//}
