//
//  SignInViewModel.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2023/01/02.
//

import Foundation
import FirebaseFirestore

/// `SignInView`의 로그인 기능 ViewModel입니다.
/// - currentUser: AdminModel? : 현재 접속한 사용자에 대한 정보입니다.
/// - requestUserLogin() : 로그인 요청기능입니다.
/// - requestUserSignOut() : 로그아웃 요청기능입니다.
final class SignInViewModel: ObservableObject {
    private let manager = UserAuthenticationManager()
    private let firestore = Firestore.firestore()
    @Published var currentUser: AdminModel?
    
    /// 관리자 로그인 요청 함수입니다. 로그인과 동시에 현재 관리자의 정보를 Firestore에서 가져옵니다.
    /// - Parameters:
    ///   - email: 관리자의 `email`
    ///   - password: 관리자의 `password`
    /// - Throws: `getCurrentUser(uid: String)`함수에서 나타날 수 있는 에러를 나타냅니다.
    /// - Returns: 로그인이 성공인지 실패인지 나타냅니다.
    func requestUserLogin(withEmail email: String, withPassword password: String) async throws -> Bool {
        guard let uid = manager.firebaseAuthenticationInstance.currentUser?.uid else { return false }
        if await manager.requestUserLogin(withEmail: email, withPassword: password) {
            try await getCurrentUser(uid: uid)
            return true
        }
        return false
    }
    
    /// 관라자 로그아웃 요청 함수입니다.
    func requestUserSignOut() {
        manager.requestUserSignOut()
        currentUser = nil
    }
    
    /// 로그인한 관리자의 `uid`를 이용해 Firestore에 저장된 관리자 정보를 불러옵니다. 이 정보는 `currentUser`프로퍼티에서 접근할 수 있습니다.
    /// - Parameter uid: 관리자의 로그인 `uid`
    /// - Throws: 관리자의 정보를 Firebase에서 불러올 때, 발생할 수 있는 에러를 나타냅니다.
    private func getCurrentUser(uid: String) async throws {
        self.currentUser = try await withCheckedThrowingContinuation { (continutaion: CheckedContinuation<AdminModel, Error>) in
            /// 관리자 정보가 있는 Firebase 경로: "~/AdminInfo/{uid}/"
            firestore
                .collection("AdminInfo")
                .document(uid)
                /// `@escaping closure` -> `async/await`버전으로 converting.
                .getDocument {snapshot, error in
                    if let error = error {
                        print("Error: \(error)")
                        /// `error`발생시 `continuation.resume(throwing: Error)` 호출
                        continutaion.resume(throwing: error)
                    }
                    
                    if let snapshot = snapshot,
                       let data = snapshot.data(),
                       let id = data["id"] as? String,
                       let lastLoginDate = data["lastLoginDate"] as? Timestamp,
                       let createdDate = data["createdDate"] as? Timestamp,
                       let userEmail = data["userEmail"] as? String,
                       let level = data["level"] as? String
                    {
                        let admin = AdminModel(
                            id: id,
                            lastLoginDate: lastLoginDate.dateValue(),
                            createdDate: createdDate.dateValue(),
                            userEmail: userEmail,
                            level: level
                        )
                        /// 정상적인 Task가 완료되면, `continuation.resume(returing: T)` 호출
                        continutaion.resume(returning: admin)
                    }
                }
        }
    }
}
