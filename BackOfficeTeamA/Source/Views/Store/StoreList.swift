//
//  StoreList.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreList: View {
    
    
    @EnvironmentObject var manager: StoreNetworkManager
    @State private var pickerSelection : Int = 0
    @State private var sortOredrTapped : Int = 0
    @State private var sortOrder = [KeyPathComparator(\StoreInfo.storeName)]
    @State var searchUserText : String = ""
    @State private var selection : StoreInfo.ID?
    @Binding var path : [StoreInfo]
    var pickerOptions : [String] = ["이름","이메일","날짜"]
    
    @State private var isSelectedDay : Bool = false
    @State private var selectDay : Date = Date()
    var dayAt : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: selectDay)
    }
    
    //필터링 검색버튼(검색목록피커설정에 대한 텍스트에 대해),날짜피커
    var results: [StoreInfo] {
        let dateFilteredData = manager.storeInfos
        
        if isSelectedDay {
            if !searchUserText.isEmpty && pickerSelection == 0{
                return dateFilteredData.filter {
                    $0.registerDateAt.contains(dayAt) &&
                    $0.storeName.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 1 {
                return dateFilteredData.filter {
                    $0.registerDateAt.contains(dayAt) &&
                    $0.storeEmail.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 2 {
                return dateFilteredData.filter {
                    $0.registerDateAt.contains(dayAt) &&
                    $0.registerDateAt.contains(searchUserText)
                }
            } else {
                return dateFilteredData.filter {
                    $0.registerDateAt.contains(dayAt)
                }
            }
        }else{
            
            if !searchUserText.isEmpty && pickerSelection == 0{
                return dateFilteredData.filter {
                    $0.storeName.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 1 {
                return dateFilteredData.filter {
                    $0.storeEmail.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 2 {
                return dateFilteredData.filter {
                    $0.registerDateAt.contains(searchUserText)
                }
            }
        }
        if sortOrder.last != nil {
            return dateFilteredData.sorted(using: sortOrder)
        }
        return dateFilteredData
    }
    
    //TODO: 날짜선택시 검색기능 불가 해결필요
    
    
    var body: some View {
        VStack{
            Table(results, selection: $selection ,sortOrder: $sortOrder) {
                TableColumn("이름", value: \.storeName)
                TableColumn("이메일", value: \.storeEmail)
                TableColumn("전화번호", value: \.phoneNumber)
                TableColumn("입점일", value:\.registerDateAt)
                
                //sort 형식때문에 Int값으로
//                TableColumn("입점", value:\.isVerifiedInt)  { storeInfo in
//                    Image(systemName: storeInfo.isVerified ? "checkmark" : "xmark")
//                        .foregroundColor(storeInfo.isVerified ? Color.green : Color.red)
//                }
//                TableColumn("밴", value:\.isBannedInt)  { storeInfo in
//                    Image(systemName: storeInfo.isBanned ? "checkmark" : "xmark")
//                        .foregroundColor(storeInfo.isBanned ? Color.red : Color.green)
//                }
            }
            .toolbar {
                //날짜 피커
                DatePicker(selection: $selectDay, in: ...Date(),displayedComponents: [.date]) {
                    Button {
                        isSelectedDay.toggle()
                    } label: {
                        Image(systemName: isSelectedDay ? "arrow.counterclockwise" : "calendar")
                    }
                }.onTapGesture {
                    isSelectedDay = true
                }
                
                Picker("Select", selection: $pickerSelection) {
                    ForEach(0..<pickerOptions.count, id: \.self) {
                        Text(pickerOptions[$0])
                    }
                }
            }
            //Table 검색
            .searchable(text: $searchUserText, prompt: "검색")
            //Table을 당기면 리프레쉬 후 다시 스토어인포 리드
            .refreshable {
                Task{
                    await manager.requestInfo()
                }
            }
            //선택한 order에 따라 manager.storeInfos를 sort
            .onChange(of: sortOrder) { newOrder in
                //print("order가 추가되었습니다")
                //manager.storeInfos.sort(using: newOrder)
            }
            //선택한 셀의 정보(storeInfo)를 불러와 path에 추가
            .onChange(of: selection) { newSelection in
                if let newSelection, let storeInfo = manager.storeInfos.first(where: { $0.id == newSelection // 첫번째로 같은 id를 찾을때까지 반복
                }) {
                    path.append(storeInfo)
                }
            }
            
        }
        .padding()

        //선택된 셀의 ID(selection)로 뷰를 이동할 수 있도록
        //각 셀에 따른 destination 설정
        .navigationDestination(for: StoreInfo.self) { storeInfo in
            StoreDetailView(storeID: storeInfo.id)
                .environmentObject(manager)
        }
        .onAppear{
            path = []
            selection = nil
        }
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
