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
                    TotalStoreView()
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
        .navigationTitle("가게 정보")
        .task {
            await manager.requestInfo()
            
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
//              // 5초 후 실행될 부분
//                //print(manager.storeInfos)
//            }
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
