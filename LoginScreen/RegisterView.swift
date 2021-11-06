//
//  RegisterView.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName = ""
    @State var buttonIsDisabled = true
    @EnvironmentObject private var user: UserManager

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
                    } else {
                        buttonIsDisabled = true
                    }
                }
            Text("\(userName.count)")
                .foregroundColor(.gray)
        }
    }

    private func registerUser() {
        if !userName.isEmpty {
            user.userName = userName
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
