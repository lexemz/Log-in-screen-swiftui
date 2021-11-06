//
//  ContentView.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager

    var body: some View {
        VStack {
            Text("Hi, \(user.userName)")
                .padding(.top, 100)
                .font(.largeTitle)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 20)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            Button("Log Out") {
                // TODO: remove user
                user.isRegistered.toggle()
            }
        }
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter

    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle)
                .font(.title)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
