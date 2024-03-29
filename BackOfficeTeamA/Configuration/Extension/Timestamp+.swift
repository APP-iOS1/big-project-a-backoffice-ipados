//
//  Timestamp+.swift
//  BackOfficeTeamA
//
//  Created by 서광현 on 2022/12/28.
//

import FirebaseFirestore

extension Timestamp {
    /// Timestamp로 날짜를 받아올 때, 날짜를 한국식 날짜로 받아오는 함수 입니다.
    /// 타임스탬프의 인스턴스(fetch된 데이터)에서 호출합니다.
    public func formattedKoreanTime() -> String {
        let date = self.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko-KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

extension Date {
    public func formattedKoreanTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko-KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
