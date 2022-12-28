//
//  ReportModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/28.
//

import Foundation
import FirebaseFirestore

/// ReportModel
/// 신고자, 신고대상, 신고이유, 날짜를 설명하기 위한 구조체
struct ReportModel: Codable ,Identifiable {
    var id: String = UUID().uuidString
    var reporter: String
    var reported: String
    var reportReason: String
    var reportedDate: Date
}
