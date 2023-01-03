//
//  OrderedItemInfo.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/31.
//

import Foundation

// MARK: customer의 구매한 아이템을 저장하는 구조체
// TODO: deliveryStatus enum정의, redeclartion 찾기
struct OrderedItemInfo: Identifiable {
    var id: String { itemUid }
    var itemUid: String
    var itemName: String
    var itemImage: String
    var price: Int
    var option: [String: Any]
    var color: String
    var amount: Int
    var deliveryStatus: String
}
