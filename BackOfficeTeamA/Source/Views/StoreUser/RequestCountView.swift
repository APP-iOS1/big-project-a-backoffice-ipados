//
//  EnrollRequestCountView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct RequestCountView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("신규 / 등록 요청")
                .font(.headline)
            Spacer()
            HStack{
                Text("3").foregroundColor(.secondary)
                Text("/ 7")
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct RequestCountView_Previews: PreviewProvider {
    static var previews: some View {
        RequestCountView().frame(height: 100)
    }
}
