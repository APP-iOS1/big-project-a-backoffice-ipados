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
    
    @State private var selection : UserInfo.ID?
    @State var path : [UserInfo] = []
    
    @State private var sortUserInfo = [KeyPathComparator(\UserInfo.lastPurchaseDate)]
    
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
        NavigationStack(path: $path) {
            VStack {
                HStack{
                    TotalCustomerView()
                    DailyVisitorView()
                    SignUpAndWithdrawalView()
                }
                .frame(height: 100)
                .padding()
                
                Table(results, selection: $selection, sortOrder: $sortUserInfo) {
                    TableColumn("Name", value: \.userName)
                    TableColumn("Nickname", value: \.userNickname)
                    TableColumn("Email", value: \.userEmail)
                    TableColumn("PhoneNumber", value: \.phoneNumber)
                }
                .toolbar {
                    Picker("Select", selection: $pickerSelection) {
                        ForEach(0..<pickerOptions.count, id: \.self) {
                            Text(pickerOptions[$0])
                        }
                    }
                }
                .onChange(of: sortUserInfo) { newOrder in
                    userInfoStore.userInfos.sort(using: newOrder)
                }
                .onChange(of: selection) { newSelection in
                    if let newSelection, let userInfo = userInfoStore.userInfos.first(where: { $0.id == newSelection
                    }) {
                        path.append(userInfo)
                    }
                }
                .searchable(text: $searchUserText, prompt: "검색")
            }
            .navigationDestination(for: UserInfo.self) { userInfo in
                CustomerInfoDetailView(userInfo: userInfo, orderInfos: orderInfoStore.OrderInfos, purchaseHistoryInfos: purchaseHistoryInfoStore.PurchaseHistoryInfos)
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
