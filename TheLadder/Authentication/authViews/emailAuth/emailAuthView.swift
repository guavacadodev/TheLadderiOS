//
//  createAccountEmailView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/12/24.
//

import SwiftUI

struct emailAuthView: View {
    @State private var passcode: String = ""
    @State private var emailAddress: String = ""
    var isLogin = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Continue With\nEmail")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                InputField(text: $emailAddress, isSecureField: false, placeholder: "-", title: "Email:", contentType: .emailAddress)
                
                if isLogin {
                    InputField(text: $passcode, isSecureField: false, placeholder: "-", title: "PassCode:", contentType: .emailAddress)
                }
                
                Button {
                    if isLogin {
                        if emailAddress.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passcode.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            Task {
                                viewModel.signInUserWithEmail(email: emailAddress, password: passcode) { success, error in
                                    if success {
                                        
                                    } else if let error = error {
                                        
                                    }
                                }
                            }
                        }
                    } else {
                        if emailAddress.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            Task {
                                try await viewModel.createUserWithEmail(email: emailAddress, password: viewModel.password, username: viewModel.username, dob: viewModel.dateOfBirth)
                            }
                        }
                    }
                } label: {
                    Text(isLogin ? "Login" : "Create Account")
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

#Preview {
    emailAuthView()
}
