//
//  CustomerNetworkManager.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/30.
//

import Foundation
import FirebaseFirestore

final class CustomerNetworkManager: ObservableObject {
    @Published var customerInfos: [CustomerInfo] = []
    //@Published var customerPurchaseHistories: [MyPurchaseHistory] = []
    //var orderItemInfos: [OrderItemInfo] = []
    private var customerDocIDs: [String: String] = [:]
    let path = Firestore.firestore()
    
    // MARK: - request method
    // MARK: requestCustomerInfo
    /// 현재 데이터베이스의 CustomerInfo에 접근하여 저장 되어 있는 customer들에 대한 데이터(서브 컬렉션 데이터 제외)를 가져옵니다.
    /// customerInfos 퍼블리싱 변수에 데이터를 저장합니다.
    @MainActor
    public func requestCustomerInfo() async -> Void {
        let customerInfoCollectionPath = path.collection("CustomerInfo")
        do {
            let snapshot = try await customerInfoCollectionPath.getDocuments()
            for document in snapshot.documents {
                self.customerInfos.append(makeCurrentCustomerInfo(with: document.data()))
//                customerDocIDs.append([document.data["userName"]:document.documentID])
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    //    // MARK: requestMyPurchaseHistory
    //    /// userName을 전달받아 해당되는 customer의 구매내역을 가져옵니다.
    //    public func requestMyPurchaseHistory(_ userName: String) async -> Void {
    //        let docID = customerDocIDs[userName]
    //        let path = path.collection("CustomerInfo").document(docID).collection("MyPurchaseHistory")
    //        do {
    //            let snapshot = try await path.getDocuments()
    //            for document in snapshot.documents {
    //                let purchaseID: String = document.data["id"] as? String ?? ""
    //                let orderInfos: [OrderInfo] = requestOrderInfos()
    //                customerPurchaseHistories.append(MyPurchaseHistory(id: purchaseID, orderInfos: orderInfos))
    //            }
    //        } catch {
    //            dump("\(#function) - DEBUG: REQUEST FAILED")
    //        }
    //    }
    
    //    private func requestOrderInfos(_ customerDocID: String, _ purchaseHistoryDocID: String) async -> Void {
    //        let path = path.collection("CustomerInfo").document(docID).collection(purchaseHistoryDocID)
    //        do {
    //            let snapshot = try await path.getDocuments()
    //            for document in snapshot.documents {
    //                self.customerInfos.append(makeOrderInfo(with: document.data()))
    //            }
    //        } catch {
    //            dump("\(#function) - DEBUG: REQUEST FAILED")
    //        }
    //    }
    //
    //    private func requestOrderItems() async -> Void {
    //
    //    }
    //
    // MARK: - make method
    // MARK: makeCurrentCustomerInfo
    /// CustomerInfo의 document 필드값들을 가져와 CustomerInfo 구조체를 생성합니다.
    /// requsetCustomerInfo 안에서 사용됩니다.
    private func makeCurrentCustomerInfo(with requestData: [String:Any]) -> CustomerInfo {
        let customerID: String = requestData["id"] as? String ?? ""
        let userName: String = requestData["userName"] as? String ?? ""
        let userEmail: String = requestData["userEmail"] as? String ?? ""
        let userNickname: String = requestData["userNickname"] as? String ?? ""
        let userAdress: String = requestData["userAdress"] as? String ?? ""
        let phoneNumber: String = requestData["phoneNumber"] as? String ?? ""
        let birthDate:Timestamp = requestData["birthDate"] as? Timestamp ?? Timestamp(date: Date.now)
        
        let currentCustomerInfo = CustomerInfo(id: customerID, userName: userName, userEmail: userEmail, userNickname: userNickname, userAdress: userAdress, phoneNumber: phoneNumber, birthDate: birthDate)
        
        return currentCustomerInfo
    }
}
//
//    private func makeOrderInfo(with requestData: [String:Any]) -> OrderInfo {
//        let orderID: String = requestData["id"] as? String ?? ""
//        let orderUserInfo: String = requestData["id"] as? String ?? ""
//        let orderTime: Timestamp = requestData["birthDate"] as? Timestamp ?? Timestamp(date: Date.now)
//        let orderItems: [OrderItemInfo] =
//        let orderAddress: String = requestData["orderAddress"] as? String ?? ""
//        let orderMessage: String = requestData["orderMessage"] as? String ?? ""
//
//        let currentOrderInfo = OrderInfo(id: orderID, orderItem: orderItems, orderTime: orderTime, orderMessage: orderMessage, payment: "")
//
//        return currentOrderInfo
//
//    }
//
//    private func makeOrderItemInfo(with requestData: [String:Any]) -> OrderItemInfo {
//        let
//    }
//
//    var id: String
//    var itemName: String
//    var price: Int
//    var option: [String:Any]
//
//}
