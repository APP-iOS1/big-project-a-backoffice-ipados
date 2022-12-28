//
//  StoreUserView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreUserView: View {
    @State private var isShowingSheet = false
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
        .navigationTitle("Store Enrollment")
        .sheet(isPresented: $isShowingSheet) {
            EnrollRequestModal()
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
