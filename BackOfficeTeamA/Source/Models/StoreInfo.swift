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
        //가게 이름
        var storeEmail: String
        //가게 위치
        var storeLocation: String
        //주소
        var registerDate: Date
    
        // 누적신고
        var reportingCount: Int
    
        var storeImage: String?
        //가게이미지 --> 파토
    
        // 전화번호
        var phoneNumber: String
        // 입점 허가 여부
        var isVerified: Bool = false
        // 입점 신청 여부
        var isSubmitted: Bool = false
        // 이용금지여부 -> 0
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
