//
//  Pie.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import SwiftUI

struct PieChart: View {
    @State var slices: [(Double, Color)]
    @State var customer: [CustomerGrowth]
    
    var body: some View {
        VStack {
            Text("Customer growth")
                .modifier(DashBoardChartTitleModifier())
            HStack {
                Canvas { context, size in
                    let total = slices.reduce(0) { $0 + $1.0 }
                    context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                    var pieContext = context
                    pieContext.rotate(by: .degrees(-90))
                    let radius = min(size.width, size.height) * 0.48
                    var startAngle = Angle.zero
                    for (value, color) in slices {
                        let angle = Angle(degrees: 360 * (value / total))
                        let endAngle = startAngle + angle
                        let path = Path { p in
                            p.move(to: .zero)
                            p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                            p.closeSubpath()
                        }
                        pieContext.fill(path, with: .color(color))
                        
                        startAngle = endAngle
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                VStack {
                    HStack {
                        Rectangle()
                            .fill(.red)
                            .frame(width: Screen.maxWidth / 30, height: Screen.maxWidth / 30)
                        Text("User - 300")
                    }
                    HStack {
                        Rectangle()
                            .fill(.red)
                            .frame(width: Screen.maxWidth / 30, height: Screen.maxWidth / 30)
                        Text("User - 300")
                    }
                }
            }
        }
        .modifier(DashBoardChartBorderModifier())
    }
}

struct Pie_Previews: PreviewProvider {
    @State static var customer = [
        CustomerGrowth(type: "User", count: 284),
        CustomerGrowth(type: "B2B User", count: 362),
        CustomerGrowth(type: "Payment", count: 362),
        CustomerGrowth(type: "Login", count: 497),
        CustomerGrowth(type: "Ekyc", count: 538),
    ]
    
    static var previews: some View {
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
