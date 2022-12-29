//
//  AdminModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/28.
//

import Foundation
import FirebaseFirestore

/// 관리자 모델
struct AdminModel: Codable, Identifiable {
    var id: String
    var lastLoginDate: Date
    var createdDate: Date
    var email: String
}
