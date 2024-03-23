//
//  alermApp.swift
//  alerm
//  
//  Created by Tokoroteen on 2024/03/22
//  
//

import SwiftUI

@main
struct alermApp: App {
    init() {
        // 通知の許可をリクエストする
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            // 許可が与えられたか、エラーの処理をここで行う
            if granted {
                print("通知の許可が与えられました。")
            } else if let error = error {
                print("通知の許可リクエストでエラーが発生しました: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            }
        }
        return true
    }
}
