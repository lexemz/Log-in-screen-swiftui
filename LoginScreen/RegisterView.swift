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
    @State var buttonIsDisabled = true

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
            .disabled(buttonIsDisabled)
        }
        .padding()
    }

    private var textFieldWithCounter: some View {
        HStack {
            TextField("Enter your name", text: $userName)
                .onChange(of: userName) { newValue in
                    if newValue.count > 2 {
                        buttonIsDisabled = false
                        countColor = .green
                    } else {
                        buttonIsDisabled = true
                        countColor = .red
                    }
                }
                .onSubmit {
                    if userName.count > 2 {
                        registerUser()
                    }
                }

            Text("\(userName.count)")
                .foregroundColor(countColor)
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
