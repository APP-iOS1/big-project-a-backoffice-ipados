//
//  TotalStoreView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct TotalStoreView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Total Store")
                .font(.headline)
            Spacer()
            HStack{
                Text("123")
                    .font(.title)
                Spacer()
                Text("4%")
                Image(systemName: true ? "arrow.up" :"arrow.down")
            }
            
        }.modifier(TopItemModifier())
    }
}

struct TotalStoreView_Previews: PreviewProvider {
    static var previews: some View {
        TotalStoreView().frame(height: 100)
    }
}

// Mark: -Modifier : 스토어 컴포넌트 뷰 속성
struct TopItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            //.shadow(color: .gray,radius: 10)
            .padding()
    }
}
