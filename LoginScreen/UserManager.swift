//
//  UserManager.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false // "Публикуемое" свойство класса
    var userName = ""
}
