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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var manager = StoreNetworkManager(with: "StoreInfo")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
