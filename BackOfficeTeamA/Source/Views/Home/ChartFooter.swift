//
//  ChartFooter.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/28.
//

import SwiftUI

struct ChartFooter: View {
    let label: String
    let growth: Int
    let percentage: Int
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(label) - 퍼센트")
                .font(.title)
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("+ \(growth)")
                        .font(.title)
                    Text("전월 대비")
                        .font(.title3)
                }
                Spacer()
                HStack {
                    Group {
                        Image(systemName: "arrow.up")
                        Text("+\(percentage)%")
                    }
                    .font(.title3)
                    .padding(.trailing, 5)

                    
                    CircleProgressBar(progress: $progressValue, percentage: percentage)
                        .frame(width: 80.0, height: 80.0)
                }


            }.padding()
        }
        .modifier(DashBoardChartBorderModifier())
    }
}

struct ChartFooter_Previews: PreviewProvider {
    static var previews: some View {
        ChartFooter(label: "test", growth: 1366, percentage: 12)
    }
}
