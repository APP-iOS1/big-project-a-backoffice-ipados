//
//  StoreNetworkManager.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation
import FirebaseFirestore

final class StoreNetworkManager: FirestoreCRUDProtocol, ObservableObject {
    typealias T = StoreInfo
    
    @Published var storeInfos: [StoreInfo] = []
    var collectionPath: CollectionReference
    var core: Firestore
    
    init(with path: String) {
        core = Firestore.firestore()
        collectionPath = core.collection(path)
    }
    
    func requestInfo() async {
        do {
            let snapshot = try await collectionPath.getDocuments()
            storeInfos = snapshot.documents.compactMap(decodeStoreInfo)
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    
    func createInfo(with data: StoreInfo) async {
        do {
            try await collectionPath.document(data.id).setData([
                "id": data.id,
                "storeName": data.storeName,
                "storeEmail": data.storeEmail,
                "storeLocation": data.storeLocation,
                "registerDate": data.registerDate,
                "reportingCount": data.reportingCount,
                "storeImage": data.storeImage ?? "nil",
                "phoneNumber": data.phoneNumber,
                "isVerified": data.isVerified,
                "isSubmitted": data.isSubmitted,
                "isBanned": data.isBanned,
            ], merge: true)
        } catch {
            dump("Error - \(error.localizedDescription)")
        }
    }

    
    private func decodeStoreInfo(with requestData: QueryDocumentSnapshot) -> StoreInfo? {
        let dict: [String: Any] = requestData.data()
        guard let id: String = dict["id"] as? String,
              let storeName: String = dict["storeName"] as? String,
              let storeEmail: String = dict["storeEmail"] as? String,
              let storeLocation: String = dict["storeLocation"] as? String,
              let registerDate: Date = (dict["registerDate"] as? Timestamp)?.dateValue(),
              let reportingCount: Int = dict["reportingCount"] as? Int,
              let storeImage: String = dict["storeImage"] as? String,
              let phoneNumber: String = dict["phoneNumber"] as? String,
              let isVerified: Bool = dict["isVerified"] as? Bool,
              let isSubmitted: Bool = dict["isSubmitted"] as? Bool,
              let isBanned: Bool = dict["isBanned"] as? Bool
        else {
            return nil
        }
        
        return StoreInfo(
            id: id,
            storeName: storeName,
            storeEmail: storeEmail,
            storeLocation: storeLocation,
            registerDate: registerDate,
            reportingCount: reportingCount,
            storeImage: storeImage,
            phoneNumber: phoneNumber,
            isVerified: isVerified,
            isSubmitted: isSubmitted,
            isBanned: isBanned
        )

    }
}
