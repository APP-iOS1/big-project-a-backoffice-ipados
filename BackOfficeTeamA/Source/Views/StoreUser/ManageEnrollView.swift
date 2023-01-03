//
//  ManageEnrollView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ManageEnrollView: View {
    @State private var isShowingSheet = false
    var dummuys1: [String] = Array(repeating:"정우 상점  [승인] - 22/11/11" ,count:50)
    var dummuys2: [String] = Array(repeating:"시현 상점 [거부] - 22/11/11" ,count:10)
    
    private func scrollToTop (proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo("ScrollTop",anchor: .top)
        }
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Group {
                    HStack {
                        Image (systemName: "flame")
                        Text ("신청기록")
                    }
                    .font (.largeTitle)
                    .padding()
                    .id("ScrollTop")
                    ForEach (0..<dummuys1.count, id: \.self) { index in
                        VStack{
                            Text (dummuys1[index])
                            Divider()
                        }
                    }
                }
                .listRowInsets (EdgeInsets ( ))
                .listRowSeparator (.hidden)
                
            }.listStyle(.plain)
                .refreshable {
                    print ("리프레시 작동함! ")
                    //add()
                }
                .overlay (alignment: .bottomTrailing) {
                    Button {
                        scrollToTop (proxy: proxy)
                    } label: {
                        Image (systemName: "arrow.up")
                            .font (.largeTitle)
                            .tint (.blue)
                            .background (
                                Circle ()
                                    .fill(.secondary)
                            )
                    }
                }
        }.modifier(StoreComponentModifier())
        
        //        VStack(alignment: .leading){
        //            Text("요청 기록")
        //                .font(.largeTitle)
        //                .padding()
        //            List {
        //
        //                ForEach(0..<10,id:\.self) { _ in
        //                    Button(action: {
        //                        isShowingSheet.toggle()
        //                    }) {
        //                        HStack{
        //                            Text("정우 상점  [승인] - 22/11/11")
        //                            Image(systemName: "checkmark")
        //                                .foregroundColor(.green)
        //                        }
        //                    }
        //                }
        //                ForEach(0..<10,id:\.self) { _ in
        //                    Button(action: {
        //                        isShowingSheet.toggle()
        //                    }) {
        //                        HStack{
        //                            Text("시현 상점 [거부] - 22/11/11")
        //                            Image(systemName: "xmark")
        //                                .foregroundColor(.red)
        //                        }
        //                    }
        //                }
        //            }
        //            Spacer()
        //        }.modifier(StoreComponentModifier())
    }
}

struct ManageEnrollView_Previews: PreviewProvider {
    static var previews: some View {
        ManageEnrollView()
    }
}
