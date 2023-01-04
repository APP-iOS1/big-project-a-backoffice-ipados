//
//  OrderInfoDetailView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/28.
//

import SwiftUI

struct OrderInfoDetailView: View {
    @EnvironmentObject var manager: StoreNetworkManager
//    @StateObject var manager: StoreNetworkManager = StoreNetworkManager(with: "StoreInfo")
    var customerInfo: CustomerInfo
    
    @State var orderInfos: [OrderInfo] = []
    
    func getOrderInfos() async {
        self.orderInfos = manager.orderInfos.filter {
            $0.orderedUserInfo == customerInfo.id
        }
    }
    
    var body: some View {
        Section(header: Text("주문정보").font(Font.largeTitle)
            .foregroundColor(Color.black).bold()) {
                ForEach(orderInfos) { order in
                    HStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("주문 ID")
                                Text("주문 날짜")
                                Text("주소")
                                Text("요청 사항")
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Text(" : ")
                                Text(" : ")
                                Text(" : ")
                                Text(" : ")
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                // 아래와 같이 옵셔널처리를 해주어야 뷰를 띄울수 있습니다.
                                Text("\(order.id ?? "")")
                                Text("\(order.orderTime?.formattedKoreanTime() ?? "")")
                                Text("\(order.orderAddress ?? "")")
                                Text("\(order.orderMessage ?? "")")
//                                Text("Test : \(order.orderedUserInfo ?? "")")
                                
                                /// order.orderedItems: [String: Any]같은 경우에는 옵셔널처리를 한 후,
                                
//                                if let orderedItems = order.orderedItems {
//                                    Text("\((orderedItems["itemName"] as? String) ?? "")")
//                                }
                            }
                        }
                        .padding()
                        .frame(width: 350, alignment: .leading)
                        
                        Divider()
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("상품명")
                                Text("가격")
                                Text("배송 상황")
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Text(" : ")
                                Text(" : ")
                                Text(" : ")
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                if let orderedItems = order.orderedItems {
                                    Text("\((orderedItems["itemName"] as? String) ?? "")")
                                    Text("\((orderedItems["price"] as? String) ?? "")")
                                    Text("\((orderedItems["deleveryStatus"] as? String) ?? "")")
                                }
                            }
                        }
                        .padding(.leading, 20)
                    }
                }
            }
            .task {
                for store in manager.storeInfos {
                    await manager.requestOrderInfo(storeId: store.id)
                }
                await getOrderInfos()
            }
            .onDisappear {
                manager.orderInfos.removeAll(keepingCapacity: false)
            }
        //주문정보 Section
    }
}

//struct OrderInfoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderInfoDetailView()
//    }
//}
