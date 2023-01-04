//
//  RequestStateView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct RequestStateView: View {
    @StateObject var manager: StoreNetworkManager
    var verifiedStores: Int {
        get {
            return manager.storeInfos.filter { $0.isVerified == true }.count
        }
    }
    
    var notVerifiedStores: Int {
        get {
            return manager.storeInfos.filter { $0.isVerified == false }.count
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("승인 / 거절")
                .font(.headline)
            Spacer()
            HStack{
                Text("\(verifiedStores)").foregroundColor(.green)
                Text("/").foregroundColor(.gray)
                Text("\(notVerifiedStores)").foregroundColor(.red)
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct RequestStateView_Previews: PreviewProvider {
    static var previews: some View {
        RequestStateView(manager: StoreNetworkManager(with: "StoreInfo")).frame(height: 100)
    }
}
