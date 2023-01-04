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
        CustomerGrowth(type: "인스타그램", count: 184, color: .red),
        CustomerGrowth(type: "구글", count: 78, color: .orange),
        CustomerGrowth(type: "페이스북", count:32, color: .yellow),
        CustomerGrowth(type: "카카오톡", count: 500, color: .green),
        CustomerGrowth(type: "네이버", count: 900, color: .blue)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        BarChart(title: "월별 매출")
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "월별 매출", growth: 1200, percentage: 40)
                    }

                    VStack {
                        PieChart(title: "Customer growth", customer: customer1)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "Customer growth", growth: 200, percentage: 70)
                    }
                }
                HStack {
                    VStack {
                        LineChart(title: "월별 트래픽")
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "월별 트래픽", growth: -200, percentage: -2)
                    }
                    VStack {
                        PieChart(title: "유입 경로", customer: customer2)
                            .modifier(DashBoardChartBorderModifier())
                        ChartFooter(label: "유입경로", growth: 10560, percentage: 55)
                    }

                }
            }
            .padding()
        }
        .navigationTitle("대시보드")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewInterfaceOrientation(.landscapeRight)
    }
}
