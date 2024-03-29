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
            HStack{
                Text("영업중 / 폐점")
                Spacer()
            }.font(.headline)
            Spacer()
            HStack{
                Text("100").foregroundColor(.green)
                Text("/").foregroundColor(.gray)
                Text("23").foregroundColor(.red)
            }.font(.title)
            
        }
        .modifier(StoreStateModifier())
        
    }
}

struct StoreStateView_Previews: PreviewProvider {
    static var previews: some View {
        StoreStateView().frame(width: 300,height: 100)
    }
}
