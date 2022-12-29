//
//  CollectionTypes.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/29.
//

import Foundation

// MARK: - Firestore 콜렉션 접근 대분류
enum CollectionType: String {
    case admin = "AdminInfo",
         customer = "CustomerInfo",
         store = "StoreInfo",
         cs = "CustomerServiceInfo"
}

// MARK: - CustomerInfo / 하위 콜렉션
enum CustomerSubcollectionType: String {
    case myCart = "MyCart"
    case myPayPlan = "MyPayPlan"
    case myPurchaseHistory = "MyPurchaseHistory"
    case myQuestion = "MyQuestion"
    case myReview = "MyReview"
}

// MARK: - AdminInfo / 하위 콜렉션
enum AdminSubcollectionType: String {
    case report = "Report"
    case notification = "Notification"
}

// MARK: - StoreInfo / 하위 콜렉션
enum StoreSubcollectionType: String {
    case itemInfo = "ItemInfo"
    case storeNotification = "StoreNotification"
    case allUserReviews = "AllUserReviews"
    case orderInfo = "OrderInfo"
}

//MARK: - Old Data > SellerInfo
//enum SellerSubcollectionType: String {
//    case itemInfo = "ItemInfo"
//    case storeInfo = "StoreInfo"
//}
