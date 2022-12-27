//
//  Bar.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Charts
import SwiftUI

struct BarChart: View {
    var data: [SalesChart] = [
        .init(type: "광고수익", count: 5),
        .init(type: "중계수수료", count: 4),
        .init(type: "후원", count: 4)
    ]
    
    var body: some View {
        VStack {
            Chart {
                BarMark(
                    x: .value("Shape Type", data[0].type),
                    y: .value("Total Count", data[0].count)
                )
                BarMark(
                     x: .value("Shape Type", data[1].type),
                     y: .value("Total Count", data[1].count)
                )
                BarMark(
                     x: .value("Shape Type", data[2].type),
                     y: .value("Total Count", data[2].count)
                )
            }
        }

    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
