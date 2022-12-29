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
    @State var searchFor = ""
    var body: some View {
        ScrollView{
            HStack{
                TotalStoreView()
                StoreStateView()
                TotalProductView()
            }
            .frame(height: 100)
            .padding()
            
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text("총 입점 수")
                            .font(Font.footnote)
                    }
                    .modifier(OptionsButtonModifier())
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("영업중인 가게")
                            .font(Font.footnote)
                    }
                    .modifier(OptionsButtonModifier())
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("폐점한 가게")
                            .font(Font.footnote)
                    }
                    .modifier(OptionsButtonModifier())
                    .padding()
                    Spacer()
                }.padding(.leading,100)
                StoreList(searchFor: $searchFor)
            }
            
        }
        .navigationTitle("가게 정보")
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
