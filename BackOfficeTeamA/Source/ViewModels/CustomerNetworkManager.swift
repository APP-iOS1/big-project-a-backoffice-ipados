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
    @Published var totalCustomer: Int = 0
    private var customerDocIDs: [String: String] = [:]
    let path = Firestore.firestore()
    
    // MARK: - request method
    // MARK: requestCustomerInfo
    /// 현재 데이터베이스의 CustomerInfo에 접근하여 저장 되어 있는 customer들에 대한 데이터(서브 컬렉션 데이터 제외)를 가져옵니다.
    /// customerInfos 퍼블리싱 변수에 데이터를 저장합니다.
    @MainActor
    public func requestCustomerInfo() async -> Void {
        totalCustomer = 0
        let customerInfoCollectionPath = path.collection("CustomerInfo")
        do {
            let snapshot = try await customerInfoCollectionPath.getDocuments()
            for document in snapshot.documents {
                self.customerInfos.append(makeCurrentCustomerInfo(with: document.data()))
                totalCustomer += 1
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    

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

