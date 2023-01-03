//
//  CustomerInfo.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/30.
//

import Foundation
import FirebaseFirestore

// MARK: 앱의 사용자 중 customer에 관한 데이터를 담고있는 구조체
struct CustomerInfo: Identifiable {
    var id: String
    var userName: String
    var userEmail: String
    var userNickname: String
    var userAdress: String
    var phoneNumber: String
    var birthDate: Timestamp?
    var userProfileImage: String?
}
