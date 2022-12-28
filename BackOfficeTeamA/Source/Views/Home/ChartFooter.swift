//
//  ChartFooter.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/28.
//

import SwiftUI

struct ChartFooter: View {
    let label: String = "Costumer growth"
    let growth = 1396
    let percentage = 12
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(label) - in percentage")
                .font(.title)
            HStack {
                VStack(alignment: .leading) {
                    Text("\(growth)")
                        .font(.title)
                    Text("more than last month")
                        .font(.title3)
                }
                Spacer()
                HStack {
                    Image(systemName: "arrow.up")
                    Text("+\(percentage)%")
                }
            }.padding()
        }
        .modifier(DashBoardChartBorderModifier())
    }
}

struct ChartFooter_Previews: PreviewProvider {
    static var previews: some View {
        ChartFooter()
    }
}
