//
//  SalesChart.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Foundation

// MARK: - 쇼핑몰 전체 매출 관리를 위한 구조체
struct ProfitByCategory: Identifiable {
    var id = UUID().uuidString
    let category: String
    let profit: Double
    var date: Date
    var animate: Bool = false

    init(category: String, profit: Double, month: Int) {
        let calendar = Calendar.autoupdatingCurrent
        self.category = category
        self.date = calendar.date(from: DateComponents(year: 2022, month: month))!
        self.profit = profit
    }
}
