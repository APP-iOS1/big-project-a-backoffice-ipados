//
//  StoreView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreView: View {
    
    @State private var rowHeight: CGFloat = 80 //list cell 높이설정
    @State private var isShowingSheet = false
    var body: some View {
        ScrollView{
                HStack{
                    TotalStoreView()
                    RequestCountView()
                    RequestStateView()
                    RequestStateView() // untitled
                }
                .frame(height: 100)
                .padding()
                
                HStack{
                    CurrentRequestView(isShowingSheet: $isShowingSheet)
                    ManageEnrollView()
                }
                .padding()
                
            StoreList()
                
        }
        .background(.quaternary)
        .navigationTitle("Store")
        .sheet(isPresented: $isShowingSheet) {
            EnrollRequestModal()
        }
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StoreView()
        }.previewInterfaceOrientation(.landscapeRight)
    }
}
