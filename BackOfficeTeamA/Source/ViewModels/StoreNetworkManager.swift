//
//  StoreNetworkManager.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation
import FirebaseFirestore

// TODO: Firebase Collection & SubCollection 데이터 불러오기
/// 1. StoreInfo - fetching
/// 2. ItemInfo - fetching
/// 3. ReviewInfo - fetching
///
final class StoreNetworkManager: FirestoreCRUDProtocol, ObservableObject {
    
    @Published var storeInfos: [StoreInfo] = []
    @Published var itemInfos: [ItemModel] = []
    @Published var reviewInfos: [ReviewPostModel] = []
    @Published var orderInfos: [OrderInfo] = []
    
    /// storeID, ItemID, ReviewID
    /// 필요한 상점 > 필요한 상품 > 필요한 리뷰
    /// .filter { $0.storeID, ItemID, ReviewID }
    
    var collectionPath: CollectionReference
    var core: Firestore
    
    init(with path: String) {
        core = Firestore.firestore()
        collectionPath = core.collection(path)
    }
    @MainActor func requestInfo() async {
        do {
            let snapshot = try await collectionPath.getDocuments()
            storeInfos = snapshot.documents.compactMap(decodeStoreInfo)
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    @MainActor func requestSubCollectionInfo(_ type: StoreSubcollectionType = .itemInfo) async {
        do {
            // path: ./StoreInfo/*
            let snapshot = try await collectionPath.getDocuments()
            
            for document in snapshot.documents {
                let id: String = document.documentID
                
                do {
                    // path: ./SotreInfo/{id}/{item, allUserReviews .. etc}
                    let path = collectionPath
                        .document(id)
                        .collection(type.rawValue)
                    
                    switch type {
                    case .itemInfo:
                        // path: ./SotreInfo/{id}/item/*
                        let data = try await path
                            .getDocuments()
                            .documents
                            .compactMap(decodeItemInfo)
                        print(" storeManager.itemInfos :\(self.itemInfos)")
                        self.itemInfos += data
                    // TODO: StoreNotification Data request
                    case .storeNotification:
                        break
                    // TODO: StoreSales Data request
                    case .storeSales:
                        break
                    default:
                        break
                    }
                } catch {
                    dump("\(#function) - DEBUG: REQUEST FAILED")
                }
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    func requestAllUserReviews(storeId: String) async {
        do {
            // path: ./StoreInfo/{id}/Item/*
            let path = collectionPath.document(storeId).collection(StoreSubcollectionType.itemInfo.rawValue)
            
            let snapshot = try await path.getDocuments()
            
            for document in snapshot.documents {
                let id: String = document.documentID
                
                do {
                    // path: ./StoreInfo/{store_id}/Item/{item_id}/AllUserReviews/*
                    let deepPath = path
                        .document(id)
                        .collection(StoreSubcollectionType.allUserReviews.rawValue)
                    
                    let data = try await deepPath
                            .getDocuments()
                            .documents
                            .compactMap(decodeReviewInfo)
                    self.reviewInfos = data
                    
                } catch {
                    dump("\(#function) - DEBUG: REQUEST FAILED")
                }
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
    @MainActor
    func requestOrderInfo(storeId: String, merge: Bool = false) async {
        if !merge {
            self.orderInfos = []
        }
        do {
            // path: ./StoreInfo/{id}/Item/*
            let path = collectionPath.document(storeId).collection(StoreSubcollectionType.itemInfo.rawValue)
            
            let snapshot = try await path.getDocuments()
            
            for document in snapshot.documents {
                let id: String = document.documentID
                
                do {
                    // path: ./StoreInfo/{store_id}/Item/{item_id}/AllUserReviews/*
                    let deepPath = path
                        .document(id)
                        .collection(StoreSubcollectionType.orderInfo.rawValue)
                    
                    let data = try await deepPath
                            .getDocuments()
                            .documents
                            .compactMap(decodeOrderInfo)
                    self.orderInfos += data
                    
                } catch {
                    dump("\(#function) - DEBUG: REQUEST FAILED")
                }
            }
        } catch {
            dump("\(#function) - DEBUG: REQUEST FAILED")
        }
    }
    
}

private extension StoreNetworkManager {
    func decodeOrderInfo(with requestData: QueryDocumentSnapshot) -> OrderInfo? {
        let dict: [String: Any] = requestData.data()
        
        let id = dict["id"] as? String
        let orderedUserInfo = dict["orderedUserInfo"] as? String
        let orderTime = (dict["orderTime"] as? Timestamp)?.dateValue()
        let orderedItems = dict["orderedItemInfo"] as? [String: Any]
        let orderAddress = dict["orderAddress"] as? String
        let orderMessage = dict["orderMessage"] as? String
        
        return OrderInfo(
            id: id,
            orderedUserInfo: orderedUserInfo,
            orderTime: orderTime,
            orderedItems: orderedItems,
            orderAddress: orderAddress,
            orderMessage: orderMessage
        )
    }
    
    func decodeReviewInfo(with requestData: QueryDocumentSnapshot) -> ReviewPostModel? {
        let dict: [String: Any] = requestData.data()
        guard
            let reviewPostId: String = dict["reviewPostId"] as? String,
            let itemId: String = dict["itemId"] as? String,
            let storeId: String = dict["storeId"] as? String,
            let reviewerId: String = dict["reviewerId"] as? String,
            let reviewPostDescription: String = dict["reviewPostDescription"] as? String,
            let postDate: Date = (dict["postDate"] as? Timestamp)?.dateValue(),
            let rate: Double = dict["rate"] as? Double
            // TODO: OrederedItemInfo가 구체적으로 정의되면 사용하기, default: []
//            let orderedItem: [OrderedItemInfo] = dict["orderedItem"] as? [OrderedItemInfo]
        else {
            return nil
        }
        
        return ReviewPostModel(
            reviewPostId: reviewPostId,
            itemId: itemId,
            storeId: storeId,
            reviewerId: reviewerId,
            reviewPostDescription: reviewPostDescription,
            postDate: postDate,
            rate: rate
        )
    }
    
    func decodeItemInfo(with requestData: QueryDocumentSnapshot) -> ItemModel? {
        let dict: [String: Any] = requestData.data()
        print(String(describing: dict["price"]) ?? "없음")
        guard
            let id: String = dict["itemId"] as? String,
            let storeId: String = dict["storeId"] as? String,
            let itemName: String = dict["itemName"] as? String,
            //let itemCategory: String = dict["itemCategory"] as? String,
            //let itemAmount: Int = dict["itemAmount"] as? Int,
            //let itemAllOption: [String: Any] = dict["itemAllOption"] as? [String: Any],
            //let itemImage: [String] = dict["itemImage"] as? [String],
            let price: Int = dict["price"] as? Int
        else {
            return nil
        }
        
        return ItemModel(
            id: id,
            storeId: storeId,
            itemName: itemName,
            //itemCategory: itemCategory,
            //itemAmount: itemAmount,
            //itemAllOption: itemAllOption,
            //itemImage: itemImage,
            price: price
        )

    }
    
    func decodeStoreInfo(with requestData: QueryDocumentSnapshot) -> StoreInfo? {
        let dict: [String: Any] = requestData.data()
        guard let id: String = dict["id"] as? String,
              let storeName: String = dict["storeName"] as? String,
              let storeEmail: String = dict["storeEmail"] as? String,
              let storeLocation: String = dict["storeLocation"] as? String,
              let registerDate: Date = (dict["registerDate"] as? Timestamp)?.dateValue(),
              let reportingCount: Int = dict["reportingCount"] as? Int,
              //let storeImage: String = dict["storeImage"] as? String,
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
            //storeImage: storeImage,
            phoneNumber: phoneNumber,
            isVerified: isVerified,
            isSubmitted: isSubmitted,
            isBanned: isBanned
        )
        
    }
    
}


//func createInfo(with data: StoreInfo) async {
//        do {
//            try await collectionPath.document(data.id).setData([
//                "id": data.id,
//                "storeName": data.storeName,
//                "storeEmail": data.storeEmail,
//                "storeLocation": data.storeLocation,
//                "registerDate": data.registerDate,
//                "reportingCount": data.reportingCount,
//                "storeImage": data.storeImage ?? "nil",
//                "phoneNumber": data.phoneNumber,
//                "isVerified": data.isVerified,
//                "isSubmitted": data.isSubmitted,
//                "isBanned": data.isBanned,
//            ], merge: true)
//        } catch {
//            dump("Error - \(error.localizedDescription)")
//        }
//    }
