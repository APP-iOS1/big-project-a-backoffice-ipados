//
//  OrderInfo.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/31.
//

import Foundation
import FirebaseFirestore

// MARK: customer의 구매내역을 저장하는 구조체
// TODO: payment enum 정의하기, 어디서 redeclartion이 걸리는지 찾기
struct OrderInfo: Identifiable {
    var id: String
    var orderUserInfo: String
    var orderTime: Timestamp
    var orderItems:[OrderItemInfo]
    var orderAddress: String
    var orderMessage: String?
    //var payment
}
