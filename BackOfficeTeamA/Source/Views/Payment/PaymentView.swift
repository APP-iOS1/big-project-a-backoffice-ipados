//
//  PaymentView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct PaymentView: View {
    private let pickerOptions = ["가게이름", "주인"]
    @State private var searchFor = ""
    @State private var pickerSelection = 0

    @State private var paymentData = PaymentModel.paymentData.sorted(using: KeyPathComparator(\.createdDate))
    @State private var sortOrder = [KeyPathComparator(\PaymentModel.createdDate)]
    @State private var selection: PaymentModel.ID?
    @State var path = [PaymentModel]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                Table(paymentData, selection: $selection, sortOrder: $sortOrder) {
                    TableColumn("가게 이름", value: \.storeName)
                    TableColumn("주인", value: \.storeOwner)
                    TableColumn("날짜", value: \.createdDate)
                }
            }
            .onChange(of: selection) { selection in
                if let selection = selection,
                   let data = paymentData.first(where: {$0.id == selection}) {
                    path.append(data)
                }
            }
            .onChange(of: sortOrder, perform: { newOrder in
                paymentData.sort(using: newOrder)
            })
            .navigationDestination(for: PaymentModel.self) { paymentData in
                EmptyView()
            }
            .searchable(text: $searchFor, prompt: "검색")
            .toolbar {
                Picker("Select", selection: $pickerSelection) {
                    ForEach(0..<pickerOptions.count, id: \.self) {
                        Text(pickerOptions[$0])
                    }
                }
            }
        }
        .navigationTitle("가게별 결제 내역")
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

// 테스트를 위한 신고 임시 모델
struct PaymentModel: Hashable, Identifiable {
    var id = UUID().uuidString
    
    var storeName: String
    var storeOwner: String
    var description: String
    var createdAt: Double
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
    
    static var paymentData: [PaymentModel] = [
        PaymentModel(storeName: "정우샵", storeOwner: "박정우", description: "우리가게가 제일 싸요", createdAt: Date().timeIntervalSince1970 - 88400),
        PaymentModel(storeName: "두영샵", storeOwner: "허두영", description: "두영이네 RAM 가게입니다.", createdAt: Date().timeIntervalSince1970 - 804800),
        PaymentModel(storeName: "다영샵", storeOwner: "장다영", description: "저희 가게는 1년간 AS 무료입니다.", createdAt: Date().timeIntervalSince1970 - 2892000),
    ]
}
