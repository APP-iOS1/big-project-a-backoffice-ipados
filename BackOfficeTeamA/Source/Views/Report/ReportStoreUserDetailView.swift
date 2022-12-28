//
//  ReportStoreUserDetailView.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2022/12/28.
//
// TODO: StoreUserDetail 정보 가져오기

import SwiftUI

struct ReportStoreUserDetailView: View {
    @State private var isShowingAlert = false
    
    var body: some View {
        VStack {
            // TODO: 스토어 데이터 뿌려주기
            List {
                
                HStack {
                    Text("This user is reported")
                    Text("5")
                        .foregroundColor(.accentColor)
                    Text("times")
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Button {
                            isShowingAlert.toggle()
                        } label: {
                            Text("Block")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.automatic)
                        .alert("Are you really going to BLOCK this user", isPresented: $isShowingAlert) {
                            Button("Cancel", role: .cancel) {}
                            Button("Block", role: .destructive) {
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

struct ReportStoreUserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportStoreUserDetailView()
    }
}
