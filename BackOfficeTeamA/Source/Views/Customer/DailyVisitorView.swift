//
//  DailyVisitorView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2023/01/02.
//

import SwiftUI

struct DailyVisitorView: View {
    @State var isIncrease: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("일일 방문자 수")
                .font(.headline)
            Spacer()
            HStack{
                Text("345")
                    .font(.title)
                Spacer()
                HStack {
                    Text("-2%")
                    Image(systemName: isIncrease ? "arrow.up" :"arrow.down")
                }
                .foregroundColor(isIncrease ? Color.green : Color.red)
            }
            
        }
        .modifier(StoreStateModifier())
    }
}

struct DailyVisitorView_Previews: PreviewProvider {
    static var previews: some View {
        DailyVisitorView()
    }
}
