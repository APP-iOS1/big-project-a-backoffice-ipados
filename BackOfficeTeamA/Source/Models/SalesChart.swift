//
//  SalesChart.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Foundation

// MARK: - 쇼핑몰 전체 매출 관리를 위한 구조체
struct SalesChart: Identifiable {
    var id = UUID().uuidString
    var type: String
    var count: Double
}
