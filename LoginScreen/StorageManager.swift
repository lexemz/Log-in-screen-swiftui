//
//  StorageManager.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func save(userName: String) {
        UserDefaults.standard.set(userName, forKey: "User")
    }
    
    func get() -> String? {
        guard let user = UserDefaults.standard.string(forKey: "User") else {
            return nil
        }
        return user
    }
    
    func remove() {
        UserDefaults.standard.removeObject(forKey: "User")
    }
}
