//
//  StoreView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreView: View {
    @StateObject var manager = StoreNetworkManager(with: "StoreInfo")
    //@EnvironmentObject var manager: StoreNetworkManager
    @State private var rowHeight: CGFloat = 80 //list cell 높이설정
    @State private var isShowingSheet = false
    @State private var path = [StoreInfo]()
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                HStack{
                    TotalStoreView(totalStore: manager.totalStore)
                    StoreStateView()
                    TotalProductView()
                }
                .frame(height: 100)
                .padding()
                StoreList(path: $path)
                    .environmentObject(manager)
                
            }
            //.navigationTitle("가게 정보")
            .sheet(isPresented: $isShowingSheet) {
                //EnrollRequestModal()
            }
        
        }
        .navigationBarTitle("가게 정보", displayMode: .inline)
        .task {
            //Read StoreInfo
            await manager.requestInfo()
        }
    }
}

//struct StoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            StoreView()
//        }.previewInterfaceOrientation(.landscapeRight)
//    }
//}
