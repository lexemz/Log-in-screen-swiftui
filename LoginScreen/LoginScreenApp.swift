//
//  LoginScreenApp.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import SwiftUI

@main
struct LoginScreenApp: App {
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
