//
//  NotificationVieww.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct OneNotificationView: View {
    let notification: Notification
    
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                ZStack(alignment: .topTrailing) {
                    Image(notification.picture)
                        .frame(width: 64, height: 64)
                    Image("indicator")
                        .padding(.top, -6)
                        .padding(.trailing, -6)
                }
                notificationDetails
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(.primaryBackground)
            Divider().overlay(.gray)
        }
        
    }
    
    private var notificationDetails: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                HStack {
                    Text(notification.subtitle)
                        .foregroundStyle(.yellow)
                        .font(.system(size: 13))
                    Spacer()
                    if(!notification.link.isEmpty) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("chain")
                                .padding(5)
                        })
                    }
                }
                Text(notification.title)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .semibold))
                Text(notification.time)
                    .foregroundStyle(.eventFooter)
                    .font(.system(size: 13))
            }
        }
    }
}

#Preview {
    let notification = Notification(id: 1, eventId: 1, picture: "notification-poster", title: "Prva Biciklijada u Vranju", created: "2023-11-01T15:00:00Z", isReaded: true, link: "")
    return OneNotificationView(notification: notification)
}
