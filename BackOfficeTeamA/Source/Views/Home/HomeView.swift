//
//  HomeView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Charts
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Bar()
                    Pie(slices: [
                        (2, .red),
                        (3, .orange),
                        (4, .yellow),
                        (1, .green),
                        (5, .blue),
                        (4, .indigo),
                        (2, .purple)
                    ])
                }
                HStack {
                    LineChart()
                    Pie(slices: [
                        (2, .red),
                        (3, .orange),
                        (4, .yellow),
                        (1, .green),
                        (5, .blue),
                        (4, .indigo),
                        (2, .purple)
                    ])
                }
            }
            .padding()
        }
        .navigationTitle("Dashboard")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
