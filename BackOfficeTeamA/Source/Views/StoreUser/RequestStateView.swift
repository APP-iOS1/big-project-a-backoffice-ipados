//
//  RequestStateView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct RequestStateView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Pass | Reject Request")
                .font(.headline)
            Spacer()
            HStack{
                Text("58").foregroundColor(.green)
                Divider()
                Text("37").foregroundColor(.red)
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct RequestStateView_Previews: PreviewProvider {
    static var previews: some View {
        RequestStateView().frame(height: 100)
    }
}
