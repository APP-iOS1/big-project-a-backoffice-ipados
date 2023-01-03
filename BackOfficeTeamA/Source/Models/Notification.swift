//
//  Notification.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2023/01/03.
//

import Foundation
import SwiftUI

struct Notification: Identifiable, Hashable {
    var id = UUID().uuidString
    var receiverId: String
    var isViewed: Bool
    var notificationTitle: String
    var notificationDescription: String
    var notificationDate: Date
    var appCategory: String
    
    var notifiactionDateAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: notificationDate)
    }
    
    var isViewedInt: Int{
        isViewed ? 1 : 0
    }
    
    var receiverName: String {
        "정우"
    }
    
    static var sample: [Notification] {
        [
            Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Store1", notificationDescription: "테스트 메시지1입니다.", notificationDate: Date(), appCategory: "store"),
            Notification(receiverId: UUID().uuidString, isViewed: false, notificationTitle: "Store2", notificationDescription: "테스트 메시지2입니다.", notificationDate: Date(), appCategory: "store"),
            Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Customer1", notificationDescription: "테스트 메시지3입니다.", notificationDate: Date(), appCategory: "customer"),
            Notification(receiverId: UUID().uuidString, isViewed: false, notificationTitle: "Customer2", notificationDescription: "테스트 메시지4입니다.", notificationDate: Date(), appCategory: "customer"),
            Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Backoffice", notificationDescription: "테스트 메시지5입니다.", notificationDate: Date(), appCategory: "backoffice")
        ]
    }
}
