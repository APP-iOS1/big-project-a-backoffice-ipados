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
    @ObservedObject var signInViewModel = SignInViewModel()

    var body: some View {
        NavigationView {
            List(selection: $selected) {
                Section() {
                    NavigationLink {
                        SignInView(signInViewModel: signInViewModel)
                    } label: {
                        Text(signInViewModel.currentUser == nil ? "로그인" : signInViewModel.currentUser?.level ?? "")
                            .frame(height:60)
                            .font(.largeTitle)
                    }

//                    Button {
//                        isShowingSigninProfileSheet.toggle()
//                    } label: {
//                        Text(signInViewModel.currentUser == nil ? "로그인" : signInViewModel.currentUser?.level ?? "")
//                            .frame(height:60)
//                            .font(.largeTitle)
//                    }
                }
                
                if signInViewModel.currentUser != nil {
                    Section{
                        NavigationLink(tag: 0, selection: $selected) {
                            HomeView()
                        } label: {
                            Text("대시보드")
                        }
                    }
                    if signInViewModel.currentUser?.level == "권한2" || signInViewModel.currentUser?.level == "권한3" {
                        // management view
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
                        if signInViewModel.currentUser?.level == "권한3" {
                            // mockup view
                            Section{
                                NavigationLink {
                                    PaymentView()
                                } label: {
                                    Text("가게별 결제 내역")
                                }
                                NavigationLink {
                                    NotificationView()
                                } label: {
                                    Text("앱 알림 관리")
                                }
                                NavigationLink {
                                    ReportView()
                                } label: {
                                    Text("신고")
                                }
                            }
                        }
                    }
                }
            }
//            .sheet(isPresented: $isShowingSigninProfileSheet, content: {
//                if !isSignedin {
//                    SignInView(signInViewModel: signInViewModel)
//                }
//            })
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
