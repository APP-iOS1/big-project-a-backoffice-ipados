//
//  CustomerNetworkManager.swift
//  BackOfficeTeamA
//
//  Created by 장다영 on 2022/12/30.
//

import Foundation
import FirebaseFirestore

//TODO: subCollection들을 어떻게 접근할지 고민
//TODO: subCollection들 중 MyPurchaseHistory에만 접근하면 되는지
//TODO: 뷰의주문정보에서 배송완료 상태인 것들을 구매내역에 보여주는게 맞는지
final class customerNetworkManager: ObservableObject {
    @Published var customerInfos: [CustomerInfo] = []
    @Published var customerPurchaseHistory: [MyPurchaseHistory] = []
    //@Published var 
    let path = Firestore.firestore()
    
    // MARK: - requestCustomerInfo
    /// 현재 데이터베이스의 CustomerInfo에 접근하여 저장 되어 있는 customer들에 대한 데이터를 가져옵니다.
    /// customerInfos 퍼블리싱 변수에 데이터를 저장합니다.
    @MainActor
    public func requestCustomerInfo() async -> Void {
        let customerInfoCollectionPath = path.collection("CustomerInfo")
        do {
            let snapshot = try await customerInfoCollectionPath.getDocuments()
            for document in snapshot.documents {
                self.customerInfos.append(makeCurrentCustomerInfo(with: document.data()))
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    // MARK: - makeCurrentCustomerInfo
    /// CustomerInfo의 document 필드값들을 가져와 CustomerInfo 구조체를 생성합니다.
    private func makeCurrentCustomerInfo(with requestData: [String:Any]) -> CustomerInfo {
        let customerId: String = requestData["id"] as? String ?? ""
        let userName: String = requestData["userName"] as? String ?? ""
        var userEmail: String = requestData["userEmail"] as? String ?? ""
        var userNickname: String = requestData["userNickname"] as? String ?? ""
        var userAdress: String = requestData["userAdress"] as? String ?? ""
        var phoneNumber: String = requestData["phoneNumber"] as? String ?? ""
        var birthDate:Timestamp = requestData["birthDate"] as? Timestamp ?? Timestamp(date: Date.now)
        
        let currentCustomerInfo = CustomerInfo(id: customerId, userName: userName, userEmail: userEmail, userNickname: userNickname, userAdress: userAdress, phoneNumber: phoneNumber, birthDate: birthDate)
        
        return currentCustomerInfo
    }

    
}
