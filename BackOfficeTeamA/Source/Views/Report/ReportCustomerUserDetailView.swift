//
//  ReportCustomerUserDetailView.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2022/12/28.
//
// TODO: CustomerDetail 정보 가져오기

import SwiftUI

struct ReportCustomerUserDetailView: View {
    @State private var isShowingAlert = false
    
    var body: some View {
        VStack {
            // TODO: 스토어 데이터 뿌려주기
            List {
                
                HStack {
                    Text("해당 사용자는")
                    Text("3")
                        .foregroundColor(.accentColor)
                    Text("번 신고되었습니다.")
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Button {
                            isShowingAlert.toggle()
                        } label: {
                            Text("이용 정지")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.automatic)
                        .alert("해당 사용자를 이용 정지 시키겠습니까?", isPresented: $isShowingAlert) {
                            Button("취소", role: .cancel) {}
                            Button("예", role: .destructive) {
                                // block action here
                            }
                        }
                        Spacer()
                    }
                }
            }
            .buttonStyle(.bordered)
            .controlSize(.regular)
        }
    }
}

struct ReportCustomerUserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCustomerUserDetailView()
    }
}
