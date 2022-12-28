//
//  HomeView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Charts
import SwiftUI

struct HomeView: View {
    @State var customer1 = [
        CustomerGrowth(type: "User", count: 284, color: .red),
        CustomerGrowth(type: "B2B User", count: 62, color: .orange),
        CustomerGrowth(type: "Payment", count: 162, color: .yellow),
        CustomerGrowth(type: "Login", count: 297, color: .green),
        CustomerGrowth(type: "Ekyc", count: 738, color: .blue)
    ]
    
    @State var customer2 = [
        CustomerGrowth(type: "Instagram", count: 184, color: .red),
        CustomerGrowth(type: "Google", count: 78, color: .orange),
        CustomerGrowth(type: "Facebook", count:32, color: .yellow),
        CustomerGrowth(type: "Kakao", count: 500, color: .green),
        CustomerGrowth(type: "Naver", count: 900, color: .blue)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        BarChart(title: "Monthly Profit")
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Monthly Profit", growth: 1200, percentage: 40)
                    }

                    VStack {
                        PieChart(title: "Customer growth", customer: customer1)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Customer growth", growth: 200, percentage: 70)
                    }
                }
                HStack {
                    VStack {
                        LineChart(title: "Monthly Traffic")
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Monthly Traffic", growth: 241, percentage: 2)
                    }
                    VStack {
                        PieChart(title: "Funnels", customer: customer2)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Funnels", growth: 10560, percentage: 55)
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
