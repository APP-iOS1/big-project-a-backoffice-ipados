//
//  StoreUserView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreUserView: View {
    @State private var isShowingSheet = false
    @State private var stores : [Store] = testStores
    var body: some View {
        VStack{
                HStack{
                    RequestCountView()
                    RequestStateView()
                }
                .frame(height: 100)
                .padding()
                
                HStack{
                    CurrentRequestView(isShowingSheet: $isShowingSheet)
                    ManageEnrollView()
                }
                .padding()
                
        }
        .navigationTitle("입점 관리")
        .sheet(isPresented: $isShowingSheet) {
            EnrollRequestModal(store: $stores[0])
        }
        
    }
}

struct StoreUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StoreUserView()
        }
    }
}
