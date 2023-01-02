//
//  StoreStateView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/28.
//

import SwiftUI

struct StoreStateView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("영업중 / 폐점")
                .font(.headline)
            Spacer()
            HStack{
                Text("100").foregroundColor(.green)
                Divider()
                Text("23").foregroundColor(.red)
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct StoreStateView_Previews: PreviewProvider {
    static var previews: some View {
        StoreStateView()
    }
}
