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
    
    // 정렬
    @State private var selection : UserInfo.ID?
    @State var path : [UserInfo] = []
    @State private var sortUserInfo = [KeyPathComparator(\UserInfo.lastPurchaseDate)]
    
    // 피커
    var pickerOptions = ["이름", "이메일", "전화번호"]
    @State private var pickerSelection = 0
    
    // 날짜 필터링
    @State private var isSelectedDay : Bool = false
    @State private var selectDay : Date = Date()
    var dayAt : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: selectDay)
    }
    
    // Data
    @StateObject var customerNetworkManager: CustomerNetworkManager = CustomerNetworkManager()
    
    var results: [CustomerInfo] {
        //filter를 날짜로 한번하고 그 이후 필터 진행
        let dateFilteredData = customerNetworkManager.customerInfos
        
        /*
        if isSelectedDay {
            if !searchUserText.isEmpty && pickerSelection == 0 {
                return dateFilteredData.filter {
                    $0.lastPurchaseDate.contains(dayAt) &&
                    $0.userName.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 1 {
                return dateFilteredData.filter {
                    $0.lastPurchaseDate.contains(dayAt) &&
                    $0.userEmail.contains(searchUserText)
                }
            } else if !searchUserText.isEmpty && pickerSelection == 2 {
                return dateFilteredData.filter {
                    $0.lastPurchaseDate.contains(dayAt) &&
                    $0.phoneNumber.contains(searchUserText)
                }
            } else {
                return dateFilteredData.filter {
                    $0.lastPurchaseDate.contains(dayAt)
                }
            }
        }else{
         */
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
//        }
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
                
                //, selection: $selection, sortOrder: $sortUserInfo
                Table(results) {
//                    TableColumn("Name", value: \.userName)
                    TableColumn("Nickname", value: \.userNickname)
                    TableColumn("Email", value: \.userEmail)
//                    TableColumn("PhoneNumber", value: \.phoneNumber)
                }
                .toolbar {
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
//                .onChange(of: sortUserInfo) { newOrder in
//                    customerNetworkManager.customerInfos.sort(using: newOrder)
//                }
//                .onChange(of: selection) { newSelection in
//                    if let newSelection, let userInfo = customerNetworkManager.customerInfos.first(where: { $0.id == newSelection
//                    }) {
//                        path.append(userInfo)
//                    }
//                }
                .searchable(text: $searchUserText, prompt: "검색")
            }
//            .navigationDestination(for: CustomerInfo.self) { customerInfo in
//                CustomerInfoDetailView(customerInfo: customerInfo, orderInfos: orderInfoStore.OrderInfos, purchaseHistoryInfos: purchaseHistoryInfoStore.PurchaseHistoryInfos)
//            }
        }
        .task {
            await customerNetworkManager.requestCustomerInfo()
        }
        .navigationTitle(navigationTitle)
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
