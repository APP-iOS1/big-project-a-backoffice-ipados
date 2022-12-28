//
//  NotificationModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/28.
//

import Foundation
import FirebaseFirestore

/// NotificationModel
/// - 알림 모델
struct NotificationModel: Codable, Identifiable {
    var notificationid: String = UUID().uuidString
    // \(수신자id)
    var receiverId: String
    var isViewed: Bool = false
    var notificationDate: Date
    var appCategory: String = AppCategoryEnum.customer.toString
    var notificationDescription: String
    var notificationTitle: String
    
    var id: String { notificationid }
}
