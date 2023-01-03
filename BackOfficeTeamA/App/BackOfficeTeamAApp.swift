//
//  BackOfficeTeamAApp.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI
import FirebaseCore

@main
struct BackOfficeTeamAApp: App {
//
//    init() {
//        setupAuthentication()
//    }
//
    //@StateObject var manager = StoreNetworkManager(with: "StoreInfo")
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environmentObject(manager)
        }
    }
}

extension BackOfficeTeamAApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
