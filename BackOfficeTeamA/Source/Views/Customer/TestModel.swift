//
//  TestModel.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/27.
//

import Foundation

struct UserInfo: Codable, Identifiable {
    var id: String
    var userName: String
    var userEmail: String
    var userNickname: String
    var userAddress: String
    var phoneNumber: String
    var birthDate: String
//    var userProfileImage: Image
}

class UserInfoStore: ObservableObject {
    @Published var userInfos: [UserInfo] = []
    
    init() {
        userInfos = [
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02")
        ]
    }
}
//
//class OrderInfo: ObservableObject {
//    var userName: String = "서찬호"
//    var userEmail: String = "test@test.com"
//    var userNickname: String = "chano"
//    var userAddress: String = "인천시 부평구 부평동"
//    var phoneNumber: String = "010-1234-5678"
//    var birthDate: String = "1995-06-13"
////    var userProfileImage: Image
//}

//class OrderItemInfo: ObservableObject {
//
//}
