//
//  OrderInfoDetailView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/28.
//

import SwiftUI

struct OrderInfoDetailView: View {
    var orderInfos: [OrderedItemInfo]
    var body: some View {
        Section(header: Text("주문정보").font(Font.largeTitle)
            .foregroundColor(Color.black).bold()) {
            ForEach(orderInfos) { order in
                HStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("상품명")
                            Text("가격")
                            Text("색상")
                            Text("주문 개수")
                            Text("배송 상황")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text(" : ")
                            Text(" : ")
                            Text(" : ")
                            Text(" : ")
                            Text(" : ")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(order.itemName)")
                            Text("\(order.price)")
                            Text("\(order.color)")
                            Text("\(order.amount)")
                            Text("\(order.deliveryStatus)")
                        }
                    }
                    .padding()
                    .frame(width: 250, alignment: .leading)
                    
                    Divider()
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("주문 시간")
                            Text("요청 사항")
                            Text("결제 수단")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text(" : ")
                            Text(" : ")
                            Text(" : ")
                        }
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("\(order.orderTime)")
//                            Text("\(order.orderMessage)")
//                            Text("\(order.payment)")
//                        }
                    }
                    .padding(.leading, 20)
                }
            }
        } //주문정보 Section
    }
}

//struct OrderInfoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderInfoDetailView()
//    }
//}
