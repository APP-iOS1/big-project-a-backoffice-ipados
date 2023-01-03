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
    @State private var path = [Store]()
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                HStack{
                    TotalStoreView()
                    StoreStateView()
                    TotalProductView()
                }
                .frame(height: 100)
                .padding()
                StoreList(path: $path)
                
            }
            //.navigationTitle("가게 정보")
            .sheet(isPresented: $isShowingSheet) {
                //EnrollRequestModal()
            }
        
        }
        .navigationTitle("가게 정보")
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StoreView()
        }.previewInterfaceOrientation(.landscapeRight)
    }
}
