//
//  SignUpAndWithdrawalView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2023/01/02.
//

import SwiftUI

struct SignUpAndWithdrawalView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("일일 가입자 수 / 탈퇴자 수")
                .font(.headline)
            Spacer()
            HStack{
                Text("100").foregroundColor(.green)
                Text("/")
                Text("23").foregroundColor(.red)
                Spacer()
            }
            .font(.title)
            
        }.modifier(StoreStateModifier())
    }
}

struct SignUpAndWithdrawalView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAndWithdrawalView()
    }
}
