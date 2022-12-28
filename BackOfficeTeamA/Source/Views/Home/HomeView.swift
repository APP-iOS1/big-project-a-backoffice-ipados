//
//  HomeView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Charts
import SwiftUI

struct HomeView: View {
    @State var customer = [
        CustomerGrowth(type: "User", count: 284, color: .red),
        CustomerGrowth(type: "B2B User", count: 62, color: .orange),
        CustomerGrowth(type: "Payment", count: 162, color: .yellow),
        CustomerGrowth(type: "Login", count: 297, color: .green),
        CustomerGrowth(type: "Ekyc", count: 738, color: .blue)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        BarChart()
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Monthly Profit", growth: 1200, percentage: 40)
                    }

                    VStack {
                        PieChart(customer: customer)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Customer growth", growth: 200, percentage: 70)
                    }
                }
                HStack {
                    VStack {
                        LineChart()
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Monthly Traffic", growth: 241, percentage: 2)
                    }
                    VStack {
                        PieChart(customer: customer)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "넣을게 없다", growth: 10560, percentage: 55)
                    }

                }
            }
            .padding()
        }
        .navigationTitle("Dashboard")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewInterfaceOrientation(.landscapeRight)
    }
}
