//
//  TotalCustomerView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2023/01/02.
//

import SwiftUI

struct TotalCustomerView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("총 회원 수")
                .font(.headline)
            Spacer()
            HStack{
                Text("12345")
                    .font(.title)
                Spacer()
                Text("7%")
                Image(systemName: true ? "arrow.up" :"arrow.down")
            }
            
        }
        .modifier(StoreStateModifier())
    }
}

struct TotalCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCustomerView()
    }
}