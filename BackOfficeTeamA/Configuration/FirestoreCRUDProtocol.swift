//
//  FirestoreCRUDProtocol.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation
import FirebaseFirestore

protocol FirestoreCRUDProtocol {
//    associatedtype T: Identifiable
    func requestInfo() async -> Void
//    func createInfo(with data: T) async -> Void
    var collectionPath: CollectionReference { get set }
    var core: Firestore { get }
}
