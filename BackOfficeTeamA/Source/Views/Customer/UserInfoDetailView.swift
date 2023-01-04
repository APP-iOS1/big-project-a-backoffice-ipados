//
//  UserInfoDetailView.swift
//  BackOfficeTeamA
//
//  Created by 서찬호 on 2022/12/28.
//

import SwiftUI

struct UserInfoDetailView: View {
    var customerInfo: CustomerInfo
    
    var body: some View {
        Section(header: Text("유저정보").font(Font.largeTitle)
            .foregroundColor(Color.black).bold()) {
            HStack {
                VStack {
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 100, height: 100)
                    Text(customerInfo.userName)
                        .font(Font.largeTitle)
                        .bold()
                }
                .padding()
                .padding(.horizontal, 10)
                Divider()
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("이메일")
                        Text("닉네임")
                        Text("주소")
                        Text("전화번호")
                        Text("생년월일")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text(" : ")
                        Text(" : ")
                        Text(" : ")
                        Text(" : ")
                        Text(" : ")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(customerInfo.userEmail)")
                        Text("\(customerInfo.userNickname)")
                        Text("\(customerInfo.userAdress)")
                        Text("\(customerInfo.phoneNumber)")
                        Text("\(customerInfo.birthDate!.formattedKoreanTime())")
                    }
                }
                .padding(.leading, 30)
            }
        }
    }
}

//struct UserInfoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInfoDetailView()
//    }
//}
