//
//  TotalStoreView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct TotalStoreView: View {
    var totalStore: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("총 입점 수")
                .font(.headline)
            Spacer()
            HStack{
                Text("\(totalStore)")
                    .font(.title)
                Spacer()
                HStack{
                    Text("4%")
                    Image(systemName: true ? "arrow.up" :"arrow.down")
                }.foregroundColor(.green)
            }
            
        }
        .modifier(StoreStateModifier())
    }
}


struct TotalStoreView_Previews: PreviewProvider {
    static var previews: some View {
        TotalStoreView().frame(height: 100)
    }
}

