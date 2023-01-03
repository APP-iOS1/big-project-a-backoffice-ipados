//
//  TestModel.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/27.
//

import Foundation


// Test용 UserInfo 데이터
struct UserInfo: Codable, Identifiable, Hashable {
    var id: String
    var userName: String
    var userEmail: String
    var userNickname: String
    var userAddress: String
    var phoneNumber: String
    var birthDate: String
    var lastPurchaseDate: String
//    var userProfileImage: Image
}

class UserInfoStore: ObservableObject {
    @Published var userInfos: [UserInfo] = []
    
    init() {
        userInfos = [
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
            ,
            UserInfo(id: UUID().uuidString, userName: "서찬호", userEmail: "test@test.com", userNickname: "chano", userAddress: "인천시 부평구", phoneNumber: "010-1111-1111", birthDate: "1995-06-13", lastPurchaseDate: "2022-12-28"),
            UserInfo(id: UUID().uuidString, userName: "전준수", userEmail: "test2@test.com", userNickname: "jun", userAddress: "서울시 강동구", phoneNumber: "010-2222-2222", birthDate: "2002-12-17", lastPurchaseDate: "2023-01-02"),
            UserInfo(id: UUID().uuidString, userName: "기태욱", userEmail: "test3@test.com", userNickname: "ki", userAddress: "부산시 해운대구", phoneNumber: "010-3333-3333", birthDate: "2002-01-02", lastPurchaseDate: "2023-01-02")
        ]
    }
}

//// Test용 OrderInfo 데이터
//struct OrderInfo: Codable, Identifiable {
//    var id: String
//    var orderItem: OrderItemInfo
//    var orderTime: String
//    var orderMessage: String
//    var payment: String
//}
//
//struct OrderItemInfo: Codable, Identifiable {
//    var id: String
//    var itemName: String
//    var itemPrice: Int
//    var itemColor: String
//    var amount: Int
//    var deliveryStatus: String
//}

class OrderInfoStore: ObservableObject {
    @Published var OrderInfos: [OrderInfo] = []
    @Published var OrderInfos2: [OrderInfo] = []
    @Published var OrderInfos3: [OrderInfo] = []
    
    init () {
        OrderInfos = [
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "M1 맥북 13인치", itemPrice: 1200000, itemColor: "black", amount: 1, deliveryStatus: "배송중"), orderTime: "2022-12-28", orderMessage: "문앞에 놓아주세요", payment: "카드"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "한성 키보드", itemPrice: 83000, itemColor: "white", amount: 3, deliveryStatus: "출고 완료"), orderTime: "2022-12-28", orderMessage: "경비실에 맡겨주세요", payment: "카드"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "로지텍 마우스", itemPrice: 21000, itemColor: "gray", amount: 5, deliveryStatus: "배송중"), orderTime: "2022-12-27", orderMessage: "문앞에 놓아주세요", payment: "무통장입금"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "LG 모니터", itemPrice: 270000, itemColor: "black", amount: 1, deliveryStatus: "상품 준비중"), orderTime: "2022-12-25", orderMessage: "전화 부탁드립니다", payment: "무통장입금")
        ]
        
        OrderInfos2 = [
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "M3 맥북 15인치", itemPrice: 1200000, itemColor: "black", amount: 1, deliveryStatus: "배송중"), orderTime: "2022-01-02", orderMessage: "문앞에 놓아주세요", payment: "카드"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "세성 키보드", itemPrice: 83000, itemColor: "white", amount: 3, deliveryStatus: "출고 완료"), orderTime: "2022-12-28", orderMessage: "경비실에 맡겨주세요", payment: "카드"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "로지텍 헤드셋", itemPrice: 21000, itemColor: "gray", amount: 5, deliveryStatus: "배송중"), orderTime: "2022-12-27", orderMessage: "문앞에 놓아주세요", payment: "무통장입금"),
//            OrderInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "삼성 모니터", itemPrice: 270000, itemColor: "black", amount: 1, deliveryStatus: "상품 준비중"), orderTime: "2022-12-25", orderMessage: "전화 부탁드립니다", payment: "무통장입금")
        ]
        
    }
}

// Test용 PurchaseHistoryInfo 데이터
struct PurchaseHistoryInfo: Identifiable {
    var id: String
    var orderItem: OrderedItemInfo
    var orderTime: String
    var orderMessage: String
    var payment: String
}

class PurchaseHistoryInfoStore: ObservableObject {
    @Published var PurchaseHistoryInfos: [PurchaseHistoryInfo] = []
    
    init () {
        PurchaseHistoryInfos = [
//            PurchaseHistoryInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "LG그램", itemPrice: 1630000, itemColor: "white", amount: 1, deliveryStatus: "배송 완료"), orderTime: "2022-11-10", orderMessage: "문앞에 놓아주세요", payment: "카드"),
//            PurchaseHistoryInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "앱코 키보드", itemPrice: 37000, itemColor: "green", amount: 2, deliveryStatus: "배송 완료"), orderTime: "2022-10-08", orderMessage: "경비실에 맡겨주세요", payment: "카드"),
//            PurchaseHistoryInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "JBL 스피커", itemPrice: 99000, itemColor: "gray", amount: 51, deliveryStatus: "배송 완료"), orderTime: "2022-03-23", orderMessage: "문앞에 놓아주세요", payment: "무통장입금"),
//            PurchaseHistoryInfo(id: UUID().uuidString, orderItem: OrderItemInfo(id: UUID().uuidString, itemName: "삼성 컴퓨터", itemPrice: 650000, itemColor: "black", amount: 1, deliveryStatus: "배송 완료"), orderTime: "2021-02-19", orderMessage: "전화 부탁드립니다", payment: "무통장입금")
        ]
    }
}
