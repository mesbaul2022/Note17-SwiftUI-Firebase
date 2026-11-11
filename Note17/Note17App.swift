//
//  Note17App.swift
//  Note17
//
//  Created by macos on 10/11/26.
//

import SwiftUI
import Firebase

@main
struct Note17App: App {
    
    @StateObject private var viewModel = AuthViewModel()

    @State private var email = ""
    @State private var password = ""

    init() {
        FirebaseApp.configure()
        print("Configured Firebase!!!")
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if viewModel.isSignedIn {
                    ContentView().environmentObject(viewModel)
                } else {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    HStack(spacing: 20) {
                        Button("Sign In") {
                            viewModel.signIn(email: email, password: password)
                        }
                        Button("Sign Up") {
                            viewModel.signUp(email: email, password: password)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
