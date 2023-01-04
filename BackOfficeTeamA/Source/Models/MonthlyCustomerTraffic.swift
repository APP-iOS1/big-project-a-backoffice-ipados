//
//  MonthlyCustomerTraffic.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Foundation

struct MonthlyCustomerTraffic: Identifiable, Hashable {
    var id = UUID().uuidString

    var name: String
    var date: Date
    var customerTraffic: Double
    var animate: Bool = false
    
    init(name: String, month: Int, customerTraffic: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.name = name
        self.date = calendar.date(from: DateComponents(year: 2022, month: month))!
        self.customerTraffic = customerTraffic
    }
}
