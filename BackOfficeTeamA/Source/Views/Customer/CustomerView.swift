//
//  CustomerView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct CustomerView: View {
    @State private var searchUseridText: String = ""
    @StateObject var userInfoStore: UserInfoStore = UserInfoStore()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("All customers")
                        .font(Font.title)
                        .bold()
                    
                    Spacer()
                    TextField("User ID", text: $searchUseridText)
                        .frame(width: 150, height: 40)
                        .border(Color.black, width: 2)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                        Text("Quick Search")
                            .font(Font.footnote)
                    }
                    .modifier(OptionsButtonModifier())
                    
                    Button {
                        
                    } label: {
                        Text("All members")
                            .font(Font.footnote)
                    }
                    .modifier(OptionsButtonModifier())
                    
                }
                
                List {
                    ForEach(userInfoStore.userInfos) { userInfo in
                        NavigationLink(destination: CustomerInfoDetailView(userInfo: userInfo)){
                            CustomerListCell(userInfo: userInfo)
                            
                        }
                    }
                }
            }
        }
    }
}

struct CustomerListCell: View {
    var userInfo: UserInfo
    @State var lastTransactionDate: String = "2022-12-27"
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(Color.black)
                    .frame(width: 50, height: 50)
                Text(userInfo.userName)
                Text(lastTransactionDate)
                Text(userInfo.userEmail)
                Text(userInfo.userNickname)
                
                Spacer()

            }
        }
    }
}

struct CustomerInfoDetailView: View {
    var userInfo: UserInfo
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(Color.black)
                    .frame(width: 100, height: 100)
                Text(userInfo.userName)
                    .font(Font.largeTitle)
                    .bold()
                
            }
            Divider()
            Spacer()
            List {
                Section(header: Text("유저정보")) {
                    Text("이메일 : \(userInfo.userEmail)")
                    Text("닉네임 : \(userInfo.userNickname)")
                    Text("주소 : \(userInfo.userNickname)")
                    Text("전화번호 : \(userInfo.phoneNumber)")
                    Text("생년월일 : \(userInfo.birthDate)")
                }
                Section(header: Text("주문정보")) {
                    Text("주문정보")
                }
                Section(header: Text("구매내역")) {
                    Text("구매내역")
                }
            }
        }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
//            .previewInterfaceOrientation(.landscapeRight)
    }
}
