//
//  PaymentDetailView.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2023/01/04.
//

import SwiftUI

struct PaymentDetailView: View {
    let paymentData: PaymentModel
    @State var goods = [
        CustomerGrowth(type: "GPU", count: 284, color: .red),
        CustomerGrowth(type: "RAM", count: 62, color: .orange),
        CustomerGrowth(type: "메인보드", count: 162, color: .yellow),
        CustomerGrowth(type: "쿨러", count: 297, color: .green),
        CustomerGrowth(type: "모니터", count: 738, color: .blue)
    ]
    
    
    var body: some View {
        VStack {
            Form {
                Section("가게 이름") {
                    Text(paymentData.storeName)
                }
                Section("소유주") {
                    Text(paymentData.storeOwner)
                }
                Section("가게 오픈일") {
                    Text(paymentData.createdDate)
                }
                Section("가게 인사말") {
                    Text(paymentData.description)
                }
                Section("판매 통계") {
                    HStack {
                        PieChart(title: "상품 판매 분포", customer: goods)
                            .frame(width: 500)
                        LineChart(title: "월별 매출")
                    }
                }
                Section("판매 기록") {
                    PaymentHistory()
                        .frame(height: 300)
                }
            }
        }
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var paymentData = PaymentModel(storeName: "정우샵", storeOwner: "박정우", description: "우리가게가 제일 싸요", createdAt: Date().timeIntervalSince1970 - 88400)
    
    static var previews: some View {
        PaymentDetailView(paymentData: paymentData).previewInterfaceOrientation(.landscapeRight)
    }
}
