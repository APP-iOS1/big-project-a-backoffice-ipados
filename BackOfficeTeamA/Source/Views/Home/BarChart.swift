//
//  Bar.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Charts
import SwiftUI

struct BarChart: View {
    // 중계수수료, 광고수익, 후원,
    @State private var data: [ProfitByCategory] = []
    let title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .modifier(DashBoardChartTitleModifier())
                Spacer()
            }
            Chart(data) {
//                RuleMark(y: .value("Break even Threshold", 20000))
//                    .foregroundStyle(by: .value("손익분기점", "손익분기점"))
                BarMark(
                    x: .value("Month", $0.date),
                    y: .value("Profit", $0.animate ? $0.profit : 0),
                    width: .automatic
                )
                .foregroundStyle(by: .value("Product Category", $0.category))
            }
            .saturation(0.5)
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) {
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartYScale(domain: 0...30000)
            .onAppear {
                var randomProfit: [Double] = []
                
                for _ in 0...11 {
                    randomProfit.append(Double(Int.random(in: 1000...10000)))
                    
                }

                
                for i in 1...12 {
                    data.append(ProfitByCategory(category: "중계수수료", profit: randomProfit.randomElement()!, month: i))
                    data.append(ProfitByCategory(category: "광고수익", profit: randomProfit.randomElement()!, month: i))
                    data.append(ProfitByCategory(category: "후원", profit: randomProfit.randomElement()!, month: i))
                    
                }
                
                
                for (index, _) in data.enumerated() {
                    withAnimation(.easeInOut.delay(Double(12) *  0.05)) {
                        data[index].animate = true
                    }
                }

            }
        }

    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(title: "Test")
    }
}
