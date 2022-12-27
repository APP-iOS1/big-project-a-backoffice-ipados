//
//  LineChart.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Charts
import SwiftUI

struct LineChart: View {
    var data: [MonthlyCustomerTraffic] = [
        MonthlyCustomerTraffic(month: 1, customerTraffic: 74),
        MonthlyCustomerTraffic(month: 2, customerTraffic: 23),
        MonthlyCustomerTraffic(month: 3, customerTraffic: 55),
        MonthlyCustomerTraffic(month: 4, customerTraffic: 76),
        MonthlyCustomerTraffic(month: 5, customerTraffic: 13),
        MonthlyCustomerTraffic(month: 6, customerTraffic: 29),
        MonthlyCustomerTraffic(month: 7, customerTraffic: 31),
        MonthlyCustomerTraffic(month: 8, customerTraffic: 86),
        MonthlyCustomerTraffic(month: 9, customerTraffic: 75),
        MonthlyCustomerTraffic(month: 10, customerTraffic: 88),
        MonthlyCustomerTraffic(month: 11, customerTraffic: 35),
        MonthlyCustomerTraffic(month: 12, customerTraffic: 62)
    ]
    
    var body: some View {
        Chart(data) {
            LineMark(x: .value("Month", $0.date), y: .value("Customer Traffic", $0.customerTraffic))
        }
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
