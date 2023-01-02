//
//  MyPurchaseHistory.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/31.
//

import Foundation
import FirebaseFirestore

// MARK: customer의 모든 구매내역들을 저장하는 구조체
struct MyPurchaseHistory: Identifiable {
    var id: String
    var orderInfos: [OrderInfo]
}
