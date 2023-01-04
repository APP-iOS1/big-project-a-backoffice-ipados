//
//  PaymentHistory.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2023/01/04.
//

import SwiftUI

struct PaymentHistory: View {
    @State private var paymentHistoryData = PaymentHistoryModel.paymentHistoryData.sorted(using: KeyPathComparator(\PaymentHistoryModel.createdDate))
    var body: some View {
        VStack {
            Table(paymentHistoryData) {
                TableColumn("구매자", value: \.customer)
                TableColumn("상품", value: \.goods)
                TableColumn("수량", value: \.amount)
                TableColumn("날짜", value: \.createdDate)
            }
        }
    }
}

struct PaymentHistory_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHistory()
    }
}
struct PaymentHistoryModel: Hashable, Identifiable {
    var id = UUID().uuidString
    
    var goods: String
    var customer: String
    var amount: String
    var createdAt: Double
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
    
    static var paymentHistoryData: [PaymentHistoryModel] = [
            PaymentHistoryModel(goods: "CPU", customer: "태영맘", amount: "3", createdAt: Date().timeIntervalSince1970 - 88400),
            PaymentHistoryModel(goods: "메인보드", customer: "다영삼촌", amount: "1", createdAt: Date().timeIntervalSince1970 - 804800),PaymentHistoryModel(goods: "쿨러", customer: "정우아빠", amount: "10", createdAt: Date().timeIntervalSince1970 - 2892000),
            PaymentHistoryModel(goods: "CPU", customer: "태영맘", amount: "3", createdAt: Date().timeIntervalSince1970 - 88400),
            PaymentHistoryModel(goods: "메인보드", customer: "다영삼촌", amount: "1", createdAt: Date().timeIntervalSince1970 - 804800),PaymentHistoryModel(goods: "쿨러", customer: "정우아빠", amount: "10", createdAt: Date().timeIntervalSince1970 - 2892000),
            PaymentHistoryModel(goods: "CPU", customer: "태영맘", amount: "3", createdAt: Date().timeIntervalSince1970 - 88400),
            PaymentHistoryModel(goods: "메인보드", customer: "다영삼촌", amount: "1", createdAt: Date().timeIntervalSince1970 - 804800),PaymentHistoryModel(goods: "쿨러", customer: "정우아빠", amount: "10", createdAt: Date().timeIntervalSince1970 - 2892000)
    ]
}
