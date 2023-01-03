//
//  CustomerInfoDetailView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/28.
//

import SwiftUI

struct CustomerInfoDetailView: View {
    var customerInfo: CustomerInfo
    var orderInfos: [OrderInfo]
//    var purchaseHistoryInfos: [PurchaseHistoryInfo]
    
    var body: some View {
        List {
            // 유저정보 섹션
            UserInfoDetailView(customerInfo: customerInfo)
            // 주문정보 섹션
            OrderInfoDetailView(orderInfos: orderInfos)
            // 구매내역 섹션
//            PurchaseHistoryInfoDetailView(purchaseHistoryInfos: purchaseHistoryInfos)
        }
        .padding(.top, -20)
    }
}

//struct CustomerInfoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerInfoDetailView()
//    }
//}
