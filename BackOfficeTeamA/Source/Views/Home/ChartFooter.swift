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
    @State var progressGrowth: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(label) - 퍼센트")
                .font(.title)
            HStack {
                VStack(alignment: .leading) {
                    Text("전월 대비")
                        .font(.title3)
                    
                    RoundedRectangle(cornerRadius: 8).fill(growth > 0 ? .green : .red)
                        .frame(maxWidth: 130, maxHeight: 50)
                        .modifier(CountingNumberAnimationModifier(number: CGFloat(progressGrowth)))
                }
                .onAppear{
                    withAnimation(.easeInOut(duration: 3).delay(1.5)){
                        self.progressGrowth = growth
                    }
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
                
                
            }
            .padding()
            
        }
        .modifier(DashBoardChartBorderModifier())
    }
    
    struct CountingNumberAnimationModifier: AnimatableModifier {
        
        var number : CGFloat = 0
        
        var animatableData: CGFloat {
            get { number }
            set { number = newValue }
        }
        
        func body(content: Content) -> some View {
            content.overlay(NumberLabelView(number: number))
        }
        
        
        
        // 숫자 라벨 뷰
        struct NumberLabelView : View {
            
            let number : CGFloat
            
            var body: some View {
                Text("\(Int(number))")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
            
        }
        
    }
}

struct ChartFooter_Previews: PreviewProvider {
    static var previews: some View {
        ChartFooter(label: "test", growth: 1366, percentage: 12)
    }
}
