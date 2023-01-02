//
//  TotalProductView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/28.
//

import SwiftUI

struct TotalProductView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("총 판매 상품")
                .font(.headline)
            Spacer()
            HStack{
                Text("1551")
                    .font(.title)
                Spacer()
                HStack{
                    Text("7%")
                    Image(systemName: true ? "arrow.up" :"arrow.down")
                }.foregroundColor(.green)
            }
            
        }
        .modifier(StoreStateModifier())
    }
}

struct TotalProductView_Previews: PreviewProvider {
    static var previews: some View {
        TotalProductView().frame(width:300,height: 50)
    }
}
