//
//  RegisterView.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var user: UserManager
    @State private var userName = ""
    private var nameIsValid: Bool {
        userName.count > 3
    }

    @State private var countColor = Color.red

    var body: some View {
        VStack {
            textFieldWithCounter

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!nameIsValid)
        }
        .padding()
    }

    private var textFieldWithCounter: some View {
        HStack {
            TextField("Enter your name", text: $userName)
                .onSubmit {
                    if userName.count > 2 {
                        registerUser()
                    }
                }

            Text("\(userName.count)")
                .foregroundColor(nameIsValid ? .green : .red)
        }
    }

    private func registerUser() {
        if !userName.isEmpty {
            user.userName = userName
            user.isRegistered.toggle()
        }

        StorageManager.shared.save(userName: userName)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
