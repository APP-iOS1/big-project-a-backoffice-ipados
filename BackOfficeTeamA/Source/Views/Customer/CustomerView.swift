//
//  CustomerView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct CustomerView: View {
    @State private var searchUserText: String = ""
    @StateObject var userInfoStore: UserInfoStore = UserInfoStore()
    @StateObject var orderInfoStore: OrderInfoStore = OrderInfoStore()
    @StateObject var purchaseHistoryInfoStore: PurchaseHistoryInfoStore = PurchaseHistoryInfoStore()
    
    // 피커
    var pickerOptions = ["이름", "이메일", "전화번호"]
    @State private var pickerSelection = 0
    
    var results: [UserInfo] {
        //filter를 날짜로 한번하고 그 이후 필터 진행
        let dateFilteredData = userInfoStore.userInfos
        
        if !searchUserText.isEmpty && pickerSelection == 0 {
            return dateFilteredData.filter {
                $0.userName.contains(searchUserText)
            }
        } else if !searchUserText.isEmpty && pickerSelection == 1 {
            return dateFilteredData.filter {
                $0.userEmail.contains(searchUserText)
            }
        } else if !searchUserText.isEmpty && pickerSelection == 2 {
            return dateFilteredData.filter {
                $0.phoneNumber.contains(searchUserText)
            }
        }
        return dateFilteredData
    }
    
    var navigationTitle: String {
        var titleText = ""
        if searchUserText.isEmpty {
            titleText = "고객 관리"
        } else {
            titleText = "'\(searchUserText)'에 대한 검색결과"
        }
        return titleText
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if !results.isEmpty {
                        ForEach(results) { userInfo in
                            NavigationLink(destination: CustomerInfoDetailView(userInfo: userInfo, orderInfos: orderInfoStore.OrderInfos, purchaseHistoryInfos: purchaseHistoryInfoStore.PurchaseHistoryInfos)){
                                CustomerListCell(userInfo: userInfo)
                            }
                        }
                    } else {
                        // 조건에 맞는 신고 데이터가 없는 경우 표시할 뷰
                        VStack {
                            Text("조건에 맞는 데이터가 없습니다")
                        }
                    }
                } //List
                .toolbar {
                    Picker("Select", selection: $pickerSelection) {
                        ForEach(0..<pickerOptions.count, id: \.self) {
                            Text(pickerOptions[$0])
                        }
                    }
                }
                .searchable(text: $searchUserText, prompt: "검색")
            }
        }
        .navigationTitle(navigationTitle)
    }
}

struct CustomerListCell: View {
    var userInfo: UserInfo
    @State var lastTransactionDate: String = "2022-12-27"
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(Color.black)
                    .frame(width: 50, height: 50)
                    .padding(.horizontal, 10)
                Text(userInfo.userName)
                    .frame(width: 100, alignment: .leading)
                    .padding(.leading, 20)
                Text(lastTransactionDate)
                    .frame(width: 200, alignment: .leading)
                Text(userInfo.userNickname)
                    .frame(width: 150, alignment: .leading)
                Text(userInfo.userEmail)
                    .frame(width: 200, alignment: .leading)
                Text(userInfo.phoneNumber)
                    .frame(width: 200, alignment: .leading)
                
                Spacer()
            }
        }
    }
}



struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
