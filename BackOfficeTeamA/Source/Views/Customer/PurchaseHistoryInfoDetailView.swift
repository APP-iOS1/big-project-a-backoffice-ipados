//
//  PurchaseHistoryInfoDetailView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/28.
//

import SwiftUI

struct PurchaseHistoryInfoDetailView: View {
    var purchaseHistoryInfos: [PurchaseHistoryInfo]
    
    var body: some View {
        Section(header: Text("구매내역").font(Font.largeTitle)
            .foregroundColor(Color.black).bold()) {
            ForEach(purchaseHistoryInfos) { history in
                HStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("상품명 :")
                            Text("가격 :")
                            Text("색상 :")
                            Text("주문 개수 :")
                            Text("배송 상황 :")
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(history.orderItem.itemName)")
                            Text("\(history.orderItem.itemPrice)")
                            Text("\(history.orderItem.itemColor)")
                            Text("\(history.orderItem.amount)")
                            Text("\(history.orderItem.deliveryStatus)")
                        }
                    }
                    .padding()
                    .frame(width: 250, alignment: .leading)
                    
                    Divider()
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("주문 시간 :")
                            Text("요청 사항 :")
                            Text("결제 수단 :")
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(history.orderTime)")
                            Text("\(history.orderMessage)")
                            Text("\(history.payment)")
                        }
                    }
                    .padding(.leading, 20)
                }
            }
        } //구매내역 Section
    }
}

//struct PurchaseHistoryInfoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PurchaseHistoryInfoDetailView()
//    }
//}
