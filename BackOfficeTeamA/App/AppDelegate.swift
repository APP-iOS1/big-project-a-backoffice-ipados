//
//  Appdelegate.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import UIKit
import FirebaseCore

/// Firebase init
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
