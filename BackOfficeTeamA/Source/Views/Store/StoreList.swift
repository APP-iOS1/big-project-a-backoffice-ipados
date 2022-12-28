//
//  StoreList.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreList: View {
    
    
    @State private var searchUseridText: String = ""
    @StateObject var userInfoStore: UserInfoStore = UserInfoStore()
    @Binding var searchFor : String
    let item = ["Store Name","Adress","Date","Availbale"]
    let columns = [
            GridItem(.flexible())
        ]
    var body: some View {
        VStack{
            VStack{
                Divider()
                    .modifier(DividerModifier())
                HStack(alignment: .center){
                    ForEach(item,id: \.self) { item in
                        Spacer()
                        Text(item).font(.headline)
                        Spacer()
                    }
                }
                Divider()
                    .modifier(DividerModifier())
            }
            //.padding()
            .frame(height: 40)
        }
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<10,id: \.self) { index in
                NavigationLink {
                    StoreDetailView()
                } label: {
                    StoreCell()
                }.buttonStyle(ThemeAnimationStyle())
            }
        }.modifier(StoreComponentModifier())
            .searchable(text: $searchFor, prompt: "Search")
        
    }
}

struct StoreList_Previews: PreviewProvider {
    @State static var searchFor = ""
    static var previews: some View {
        NavigationStack{
            StoreList(searchFor: $searchFor)
        }
    }
}

// MARK: -ButtonStyle : 버튼 선택시 애니메이션 효과 적용
struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? .gray.opacity(0.3) : .white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0) //<- change scale value as per need. scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}
