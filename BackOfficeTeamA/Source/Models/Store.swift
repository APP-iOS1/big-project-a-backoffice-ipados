//
//  Store.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Foundation

struct Store : Identifiable, Hashable {
    var id: String
    var name : String
    var email : String
    var location : String
    var registerDateAt : String
    var reportingCount : Int
    var imageURL : String?
    var phoneNumber : String
    var isVerified : Bool
    var isBanned : Bool
    
    // MARK: - 연산 프로퍼티
    var isVerifiedInt : Int {
        isVerified ? 0 : 1
    }
    var isBannedInt : Int {
        isBanned ? 0 : 1
    }
    
    
}


var testStores : [Store] = [
    Store(id: UUID().uuidString, name: "허두영", email: "test1@gmail.com", location: "경기도 수원시 우만동 40-2 침하하 오피스", registerDateAt: "2023-01-01 00:00", reportingCount: 2, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false),
    Store(id: UUID().uuidString, name: "김두영", email: "test2@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-02 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: false, isBanned: false),
    Store(id: UUID().uuidString, name: "박두영", email: "test3@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-03 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false),
    Store(id: UUID().uuidString, name: "서두영", email: "test4@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-02 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false),
    Store(id: UUID().uuidString, name: "장두영", email: "test5@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-02 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false),
    Store(id: UUID().uuidString, name: "원두영", email: "test6@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-02 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false),
    Store(id: UUID().uuidString, name: "최두영", email: "test7@gmail.com", location: "경기도 화성시 동탄반석로 264 얼렁뚱땅 오피스", registerDateAt: "2023-01-01 00:00", reportingCount: 0, phoneNumber: "010-1111-1111", isVerified: true, isBanned: false)
]
