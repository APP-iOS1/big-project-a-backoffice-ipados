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
    @State var percentage = 12
    @State var progressValue: Float = 0.0
    
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
                    Group {
                        Image(systemName: "arrow.up")
                        Text("+\(percentage)%")
                    }.padding(.trailing)
                    
                    CircleProgressBar(progress: $progressValue, percentage: percentage)
                        .frame(width: 80.0, height: 80.0)
                        .onAppear {
                            progressValue = Float(percentage)/100.0
                        }
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
