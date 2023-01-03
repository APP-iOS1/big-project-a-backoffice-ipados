//
//  StoreInfo.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation

struct StoreInfo: Identifiable {
    var id: String
    var storeName: String
    var storeEmail: String
    var storeLocation: String
    var registerDate: Date
    // 누적신고
    var reportingCount: Int
    var storeImage: String?
    var phoneNumber: String
    // 입점 허가 여부
    var isVerified: Bool = false
    // 입점 신청 여부
    var isSubmitted: Bool = false
    // 경고 여부
    var isBanned: Bool = false
}
