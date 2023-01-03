//
//  StoreInfo.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation

struct StoreInfo: Identifiable,Hashable {
        var id: String // id: UUID().uuidString
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
        
        // MARK: - 연산 프로퍼티
        var isVerifiedInt : Int {
            isVerified ? 0 : 1
        }
        var isVerifiedString : String {
            isVerified ? "0" : "1"
        }
        var isBannedInt : Int {
            isBanned ? 0 : 1
        }
    
        var registerDateAt : String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            return dateFormatter.string(from: registerDate)
        }
}
