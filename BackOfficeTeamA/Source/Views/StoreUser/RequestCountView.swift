//
//  EnrollRequestCountView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct RequestCountView: View {
    @StateObject var manager: StoreNetworkManager
    var newStores: Int {
        get {
            return manager.storeInfos.filter { $0.isSubmitted == true && $0.isVerified == false }.count
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("입점 요청")
                .font(.headline)
            Spacer()
            HStack{
                Text("\(newStores)").foregroundColor(.secondary)
//                Text("/")
//                Text("7")
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct RequestCountView_Previews: PreviewProvider {
    static var previews: some View {
        RequestCountView(manager: StoreNetworkManager(with: "StoreInfo")).frame(height: 100)
    }
}
