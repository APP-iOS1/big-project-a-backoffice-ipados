//
//  StoreUserView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreUserView: View {
    @State private var isShowingSheet = false
    
    @StateObject var manager: StoreNetworkManager = StoreNetworkManager(with: "StoreInfo")
    
    var body: some View {
        VStack{
                HStack{
                    RequestCountView(manager: manager)
                    RequestStateView(manager: manager)
                }
                .frame(height: 100)
                .padding()
                
                HStack{
                    CurrentRequestView(isShowingSheet: $isShowingSheet, manager: manager)
                    ManageEnrollView(manager: manager)
                }
                .padding()
                
        }
        .navigationTitle("입점 관리")

        .task {
            await manager.requestInfo()
        }
        
    }
}

struct StoreUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StoreUserView(manager: StoreNetworkManager(with: "StoreInfo"))
        }
    }
}
