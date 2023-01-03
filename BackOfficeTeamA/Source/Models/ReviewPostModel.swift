//
//  ReviewPostModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/03.
//

import Foundation

struct ReviewPostModel {
    var reviewPostId: String
    var itemId: String
    var storeId: String
    var reviewerId: String
    var reviewPostDescription: String
    var postDate: Date
    var rate: Double
    var orderedItem: [OrderedItemInfo] = []
}

struct OrderedItemInfo {
    
}
