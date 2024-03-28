//
//  loginAccountGoogleView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI

struct loginAccountGoogleView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Button {
            viewModel.isGoogleSignInSuccessfull = false
            viewModel.isFacebookSignInSuccessfull = false
            Task {
                let userName = defaults.string(forKey: "user_name")
                let dob = defaults.string(forKey: "user_birthday")
                let userPassword = defaults.string(forKey: "user_password")
                try await viewModel.signInWithGoogle(password: userPassword ?? "", username: userName ?? "", dob: dob ?? "")
            }
        } label: {
            Text("Login with Google")
                .foregroundColor(.white)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .background(.red1)
                .cornerRadius(10)
        }
        .padding()
        .background(NavigationLink("", destination: ProfileView(), isActive: $viewModel.isGoogleSignInSuccessfull))
    }
}

#Preview {
    loginAccountGoogleView()
}
