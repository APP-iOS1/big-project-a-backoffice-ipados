//
//  Modifiers.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Foundation
import SwiftUI

// Mark: -Modifier : 스토어 컴포넌트 뷰 속성
struct StoreComponentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            //.shadow(color: .gray,radius: 10)
            .padding()
    }
}
