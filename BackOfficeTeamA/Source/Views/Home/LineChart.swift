//
//  LineChart.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Charts
import SwiftUI

struct LineChart: View {
    let title: String
    
    let data =
    [
        MonthlyCustomerTraffic(name: "customer", month: 1, customerTraffic: 14),
        MonthlyCustomerTraffic(name: "customer", month: 2, customerTraffic: 23),
        MonthlyCustomerTraffic(name: "customer", month: 3, customerTraffic: 35),
        MonthlyCustomerTraffic(name: "customer", month: 4, customerTraffic: 46),
        MonthlyCustomerTraffic(name: "customer", month: 5, customerTraffic: 53),
        MonthlyCustomerTraffic(name: "customer", month: 6, customerTraffic: 49),
        MonthlyCustomerTraffic(name: "customer", month: 7, customerTraffic: 61),
        MonthlyCustomerTraffic(name: "customer", month: 8, customerTraffic: 76),
        MonthlyCustomerTraffic(name: "customer", month: 9, customerTraffic: 65),
        MonthlyCustomerTraffic(name: "customer", month: 10, customerTraffic: 58),
        MonthlyCustomerTraffic(name: "customer", month: 11, customerTraffic: 65),
        MonthlyCustomerTraffic(name: "customer", month: 12, customerTraffic: 82)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
            }
            .modifier(DashBoardChartTitleModifier())
            Chart {
                ForEach(data) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Customer Traffic", item.customerTraffic)
                    )
                    .foregroundStyle(by: .value("customer", item.name))
                }
                
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) {
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartPlotStyle { plotArea in
                plotArea.background(.blue.opacity(0.1))
            }
        }
        
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(title: "test")
    }
}
