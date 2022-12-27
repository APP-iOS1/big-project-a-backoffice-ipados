//
//  MonthlyCustomerTraffic.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Foundation

struct MonthlyCustomerTraffic: Identifiable {
    var id = UUID().uuidString

    var date: Date
    var customerTraffic: Double
    
    init(month: Int, customerTraffic: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2022, month: month))!
        self.customerTraffic = customerTraffic
    }
}
