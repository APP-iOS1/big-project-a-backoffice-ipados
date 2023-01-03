//
//  ContentView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selected: Int? = 0
    @State private var isSignedin = false
    @State private var isShowingSigninProfileSheet = false
    
    var body: some View {
        NavigationView {
            List(selection: $selected) {
                Section() {
                    Button {
                        isShowingSigninProfileSheet.toggle()
                    } label: {
                        Text("Master")
                            .frame(height:60)
                            .font(.largeTitle)
                    }
                }
                
                Section{
                    NavigationLink(tag: 0, selection: $selected) {
                        HomeView()
                    } label: {
                        Text("대시보드")
                    }
                }
                
                Section{
                    NavigationLink {
                        CustomerView()
                    } label: {
                        Text("고객 관리")
                    }
                    NavigationLink {
                        StoreView()
                    } label: {
                        Text("가게 정보")
                    }
                    NavigationLink {
                        StoreUserView()
                    } label: {
                        Text("입점 관리")
                    }
                }
                
                Section{
                    NavigationLink {
                        PaymentView()
                    } label: {
                        Text("가게별 결제 내역")
                    }
                }
                
                Section {
                    NavigationLink {
                        NotificationView()
                    } label: {
                        Text("앱 알림 관리")
                    }
                }
                
                Section{
                    NavigationLink {
                        ReportView()
                    } label: {
                        Text("신고")
                    }
                }
                
            }
            .sheet(isPresented: $isShowingSigninProfileSheet, content: {
                if !isSignedin {
                    SignInView()
                }
            })
//            .toolbar(.hidden)
            .listStyle(.insetGrouped)
//            .searchable(text: $searchText,prompt: "Search")
            .navigationTitle("태영전자")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
