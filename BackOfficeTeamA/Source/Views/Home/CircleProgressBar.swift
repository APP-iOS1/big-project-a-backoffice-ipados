//
//  CircleProgressbar.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/28.
//

import SwiftUI

struct CircleProgressBar: View {
    @Binding var progress: Float
    var color: Color = .green
    let percentage: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.2)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0))
            Text("\(percentage)%")
        }
    }
}

struct CircleProgressbar_Previews: PreviewProvider {
    @State static var progress: Float = 0.0
    static var previews: some View {
        CircleProgressBar(progress: $progress, percentage: 16)
            .frame(width: 160.0, height: 160.0)
    }
}
