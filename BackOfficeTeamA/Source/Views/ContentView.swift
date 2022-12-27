//
//  ContentView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            
            List{
                Section{
                    NavigationLink {
                        DashBoardView()
                    } label: {
                        Text("Home")
                    }.tag(0)
                }
                
                Section{
                    NavigationLink {
                        CustomerView()
                    } label: {
                        Text("Customer")
                    }
                    NavigationLink {
                        StoreView()
                    } label: {
                        Text("Store")
                    }
                    NavigationLink {
                        StoreUserView()
                    } label: {
                        Text("Store User")
                    }
                }
                
                Section{
                    NavigationLink {
                        PaymentView()
                    } label: {
                        Text("Payment")
                    }
                    NavigationLink {
                        LogView()
                    } label: {
                        Text("Log")
                    }
                    NavigationLink {
                        AdView()
                    } label: {
                        Text("Ad")
                    }
                }
                
                Section {
                    NavigationLink {
                        NoticeView()
                    } label: {
                        Text("Notice")
                    }
                    NavigationLink {
                        NotificationView()
                    } label: {
                        Text("Notification")
                    }
                }
                
                Section{
                    NavigationLink {
                        ReportView()
                    } label: {
                        Text("Report")
                    }
                }
                
            }
            .listStyle(.insetGrouped)
            .searchable(text: $searchText,prompt: "Search")
            .navigationTitle("Back Office")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
