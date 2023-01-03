//
//  Notification.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2023/01/03.
//

import Foundation

struct Notification {
    var id = UUID().uuidString
    var receiverId: String
    var isViewed: Bool
    var notificationTitle: String
    var notificationDescription: String
    var notificationDate: Date
    var appCategory: String
}

let dummyNoti = [
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Store1", notificationDescription: "메세지1입니다.", notificationDate: Date(), appCategory: "store")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Store2", notificationDescription: "메세지2입니다.", notificationDate: Date(), appCategory: "store")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Customer1", notificationDescription: "메세지3입니다.", notificationDate: Date(), appCategory: "customer")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Customer2", notificationDescription: "메세지4입니다.", notificationDate: Date(), appCategory: "customer")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Noti1", notificationDescription: "메세지5입니다.", notificationDate: Date(), appCategory: "backoffice")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Noti1", notificationDescription: "메세지6입니다.", notificationDate: Date(), appCategory: "backoffice")
    Notification(receiverId: UUID().uuidString, isViewed: true, notificationTitle: "Noti1", notificationDescription: "메세지7입니다.", notificationDate: Date(), appCategory: "backoffice")
]
