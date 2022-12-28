//
//  Pie.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import SwiftUI

struct PieChart: View {
    let title: String
    @State var customer: [CustomerGrowth]
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .modifier(DashBoardChartTitleModifier())
                Spacer()
            }
            HStack {
                Canvas { context, size in
                    let total = customer.reduce(0) { $0 + $1.count }
                    context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                    var pieContext = context
                    pieContext.rotate(by: .degrees(-90))
                    let radius = min(size.width, size.height) * 0.48
                    var startAngle = Angle.zero
                    for value in customer {
                        let angle = Angle(degrees: 360 * (Double(value.count) / Double(total)))
                        let endAngle = startAngle + angle
                        let path = Path { p in
                            p.move(to: .zero)
                            p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                            p.closeSubpath()
                        }
                        pieContext.fill(path, with: .color(value.color))
                        
                        startAngle = endAngle
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                VStack(alignment: .leading) {
                    ForEach(customer) { customer in
                        HStack {
                            Rectangle()
                                .fill(customer.color)
                                .frame(width: Screen.maxWidth / 30, height: Screen.maxWidth / 30)
                            Text("\(customer.type) - \(customer.count)")
                        }
                    }
                }
            }
        }
    }
}

struct Pie_Previews: PreviewProvider {
    @State static var customer = [
        CustomerGrowth(type: "User", count: 284, color: .red),
        CustomerGrowth(type: "B2B User", count: 62, color: .orange),
        CustomerGrowth(type: "Payment", count: 162, color: .yellow),
        CustomerGrowth(type: "Login", count: 297, color: .green),
        CustomerGrowth(type: "Ekyc", count: 738, color: .blue)
    ]
    
    static var previews: some View {
        PieChart(title: "test",customer: customer)
    }
}
