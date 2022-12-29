//
//  AppCategoryEnum.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/28.
//

import Foundation

let BackofficeAppCategory: AppCategoryEnum = .backoffice

/// 앱 사용자 분류를 위한 카테고리
enum AppCategoryEnum: String {
    case customer
    case store
    case backoffice
    
    var toString: String {
        switch self {
        case .customer: return "customer"
        case .store: return "store"
        case .backoffice: return "backoffice"
        }
    }
}

///// 앱 사용자 분류를 위한 카테고리
//enum AppCategoryEnum: String {
//    case customer
//    case store
//    case backoffice
//
//    var toString: String {
//        switch self {
//        case .customer: return "customer"
//        case .store: return "store"
//        case .backoffice: return "backoffice"
//        }
//    }
//}
