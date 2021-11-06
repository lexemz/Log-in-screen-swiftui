//
//  UserManager.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import Combine
import Foundation

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var userName = ""
    
    init() {
        
        if let userName = StorageManager.shared.get() {
            self.userName = userName
            isRegistered.toggle()
        }
    }
}
