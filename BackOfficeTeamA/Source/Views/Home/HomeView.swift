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
                        ChartFooter()
                    }

                    VStack {
                        PieChart(customer: customer)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter()
                    }
                }
                HStack {
                    VStack {
                        LineChart()
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter()
                    }
                    VStack {
                        PieChart(customer: customer)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter()
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
