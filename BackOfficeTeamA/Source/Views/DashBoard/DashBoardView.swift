//
//  HomeView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Charts
import SwiftUI

struct DashBoardView: View {
    private let spacing: CGFloat = 40.0
    
    @State var customer = [
        CustomerGrowth(type: "User", count: 284),
        CustomerGrowth(type: "B2B User", count: 362),
        CustomerGrowth(type: "Payment", count: 362),
        CustomerGrowth(type: "Login", count: 497),
        CustomerGrowth(type: "Ekyc", count: 538),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: spacing) {
                HStack(spacing: spacing) {
                    BarChart()
                    PieChart(slices: [
                        (2, .red),
                        (3, .orange),
                        (4, .yellow),
                        (1, .green),
                        (5, .blue),
                        (4, .indigo),
                        (2, .purple)
                    ], customer: customer)
                }
                HStack(spacing: spacing) {
                    LineChart()
                    PieChart(slices: [
                        (2, .red),
                        (3, .orange),
                        (4, .yellow),
                        (1, .green),
                        (5, .blue),
                        (4, .indigo),
                        (2, .purple)
                    ], customer: customer)
                }
            }
            .padding()
        }
        .navigationTitle("Dashboard")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView().previewInterfaceOrientation(.landscapeLeft)
    }
}
