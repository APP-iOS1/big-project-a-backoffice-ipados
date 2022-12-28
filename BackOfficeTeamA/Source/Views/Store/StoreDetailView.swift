//
//  StoreDetailView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/28.
//

import SwiftUI

struct StoreDetailView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .stroke(Color.black)
                    .frame(width: 50, height: 50)
                    .padding(.trailing,20)
                Text("얼렁뚱땅 상점")
                    .font(Font.largeTitle)
                    .bold()
            }
            .padding(.leading,50)
            Divider()
            Spacer()
            List {
                Section(header: Text("Store Info")) {
                    Text("이름 : 이세화")
                    Text("사업자번호 : 110-42-15742")
                    Text("이메일 : test@test.com")
                    Text("주소 : 경기도 화성시 동탄반석로264 얼렁뚱땅 오피스 37-4")
                    Text("전화번호 : 010-1111-1111")
                    Text("등록일 : 2022년 12월 22일 11:40")
                    HStack{
                        Text("등록: ")
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
                Section(header: Text("상품 목록")) {
                    Text("상품 정보")
                }
                Section(header: Text("리뷰 목록")) {
                    Text("리뷰 내역")
                }
            }
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView()
    }
}
