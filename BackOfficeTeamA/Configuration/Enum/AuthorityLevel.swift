//
//  AuthorityLevel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation

//MARK: - 관리자 권한 레벨
/// - 관리자 권한을 3단계로 나눠서, `staff`사원, `manager`대리, `super`부장급으로 구분했습니다.
enum AuthorityLevel: Codable {
    case staff
    case manager
    case `super`
    
    var toString: String {
        switch self {
        case .staff: return "Staff"
        case .manager: return "Manager"
        case .super: return "Super"
        }
    }
}
