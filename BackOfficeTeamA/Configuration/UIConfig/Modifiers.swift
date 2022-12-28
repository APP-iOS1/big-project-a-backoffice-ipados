//
//  Modifiers.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import Foundation
import SwiftUI

// MARK: -Modifier : 스토어 컴포넌트 뷰 속성
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
            
// MARK: -Modifier : Main 버튼 속성
struct MainButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 60)
            .font(Font.title)
            .bold()
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(20)
    }
}

// MARK: -Modifier : Sub 버튼 속성
struct SubButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 50)
            .font(Font.title3)
            .bold()
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(20)
    }
}

// MARK: -Modifier : Options 버튼 속성
struct OptionsButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 130, height: 40)
            .bold()
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(20)
    }
}

// MARK: -Modifier : Dashboard 차트 타이틀 속성
struct DashBoardChartTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}

// MARK: -Modifier : Dashboard 차트 border 속성
struct DashBoardChartBorderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .border(.black)
    }
}

// MARK: -Modifier : 스토어 상태 컴포넌트 뷰 속성
struct StoreStateModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            .padding()
    }
}

// MARK: -Modifier : 구분선 두께 속성
struct DividerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                Color.black
            }
    }
}
