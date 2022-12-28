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
            Text("Total Products")
                .font(.headline)
            Spacer()
            HStack{
                Text("1551")
                    .font(.title)
                Spacer()
                Text("7%")
                Image(systemName: true ? "arrow.up" :"arrow.down")
            }
            
        }
        .modifier(StoreStateModifier())
    }
}

struct TotalProductView_Previews: PreviewProvider {
    static var previews: some View {
        TotalProductView()
    }
}
