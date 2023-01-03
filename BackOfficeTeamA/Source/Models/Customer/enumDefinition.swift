//
//  enumDefinition.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2023/01/03.
//

import Foundation

enum DeliveryStatusEnum: String, Codable {
    case pending = "배송준비중",
         onDeliverying = "배송중",
         didDelieveried = "배송완료"
}

enum PaymentEnum: String, Codable {
    case byCreditCard = "카드결제",
         byAccount = "무통장입금",
         byMobile = "핸드폰결제"
}
