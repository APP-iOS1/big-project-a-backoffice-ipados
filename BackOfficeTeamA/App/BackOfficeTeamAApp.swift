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
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension BackOfficeTeamAApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
