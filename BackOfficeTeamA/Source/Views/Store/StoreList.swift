//
//  StoreList.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreList: View {
    
    
    
    @State private var pickerSelection : Int = 0
    @State private var sortOrder = [KeyPathComparator(\Store.registerDateAt)]
    @State var searchUserText : String = ""
    @State private var selection : Store.ID?
    @Binding var path : [Store]
    var pickerOptions : [String] = ["이름","이메일","날짜"]
    var results: [Store] {
        //filter를 날짜로 한번하고 그 이후 필터 진행
        let dateFilteredData = testStores
        
        if !searchUserText.isEmpty && pickerSelection == 0 {
            return dateFilteredData.filter {
                $0.name.contains(searchUserText)
            }
        } else if !searchUserText.isEmpty && pickerSelection == 1 {
            return dateFilteredData.filter {
                $0.email.contains(searchUserText)
            }
        } else if !searchUserText.isEmpty && pickerSelection == 2 {
            return dateFilteredData.filter {
                $0.registerDateAt.contains(searchUserText)
            }
        }
        return dateFilteredData
    }
    
    var body: some View {
        //NavigationStack(path: $path){
            VStack{
                Table(results, selection: $selection ,sortOrder: $sortOrder) {
                    TableColumn("이름", value: \.name)
                    TableColumn("이메일", value: \.email)
                    TableColumn("전화번호", value: \.phoneNumber)
                    TableColumn("입점일", value:\.registerDateAt)
                    
                    //sort 형식때문에 Int값으로
                    TableColumn("입점", value:\.isVerifiedInt)  { store in
                        Image(systemName: store.isVerified ? "checkmark" : "xmark")
                            .foregroundColor(store.isVerified ? Color.green : Color.red)
                    }
                    TableColumn("밴", value:\.isBannedInt)  { store in
                        Image(systemName: store.isBanned ? "checkmark" : "xmark")
                            .foregroundColor(store.isBanned ? Color.red : Color.green)
                    }
                }
                .toolbar {
                    Picker("Select", selection: $pickerSelection) {
                        ForEach(0..<pickerOptions.count, id: \.self) {
                            Text(pickerOptions[$0])
                        }
                    }
                }
                .searchable(text: $searchUserText, prompt: "검색")
                
                .refreshable {
                    //
                }
                .onChange(of: sortOrder) { newOrder in
                    testStores.sort(using: newOrder)
                }
                .onChange(of: selection) { newSelection in
                    if let newSelection, let store = testStores.first(where: { $0.id == newSelection
                    }) {
                        path.append(store)
                    }
                }
                
            }.padding()
                .navigationDestination(for: Store.self) { store in
                    StoreDetailView(store: store)
                    
                }
        //}
        //.searchable(text: $searchFor, prompt: "검색")
        
    }
}

//struct StoreList_Previews: PreviewProvider {
//    @State static var searchFor = ""
//    static var previews: some View {
//        NavigationStack{
//            StoreList(searchFor: $searchFor)
//        }
//    }
//}

// MARK: -ButtonStyle : 버튼 선택시 애니메이션 효과 적용
struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? .gray.opacity(0.3) : .white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0) //<- change scale value as per need. scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}
