//
//  ItemModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/03.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String
    var storeId: String
    var itemName: String
    var itemCategory: String
    var itemAmount: Int
    var itemAllOption: [String: Any]
    var itemImage: [String]
    var price: Int
}
