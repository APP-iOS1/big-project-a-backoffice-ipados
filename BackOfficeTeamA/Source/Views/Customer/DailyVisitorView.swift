//
//  DailyVisitorView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2023/01/02.
//

import SwiftUI

struct DailyVisitorView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("일일 방문자 수")
                .font(.headline)
            Spacer()
            HStack{
                Text("345")
                    .font(.title)
                Spacer()
                Text("-2%")
                Image(systemName: true ? "arrow.up" :"arrow.down")
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
