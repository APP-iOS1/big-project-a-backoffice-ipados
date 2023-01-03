//
//  CurrentEnrollRequest.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct CurrentRequestView: View {
    @Binding var isShowingSheet : Bool
    var dummuys1 = Array(repeating: "두영상점 - 5분 전 ", count: 50)
    
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
                        Text ("입점 신청")
                    }
                    .font(.largeTitle)
                    .padding()
                    .id("ScrollTop")
                    ForEach (0..<dummuys1.count, id: \.self) { index in
                        VStack{
                            Button(action: {
                                isShowingSheet.toggle()
                            }) {
                                Text(dummuys1[index])
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                            .overlay {
                                Divider().modifier(DividerModifier()).padding(.top,50)
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
    }
}

struct CurrentRequestView_Previews: PreviewProvider {
    
    @State static var isShowingSheet : Bool = false
    
    static var previews: some View {
        CurrentRequestView(isShowingSheet: $isShowingSheet)
    }
}
