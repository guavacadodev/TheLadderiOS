//
//  loginAccountFacebookView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI

struct loginAccountFacebookView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isFacebookSignInSuccessfull: Bool = false
    
    var body: some View {
        Button {
            viewModel.isGoogleSignInSuccessfull = false
            viewModel.isFacebookSignInSuccessfull = false
            Task {
                 viewModel.logInWithFacebook { success, error in
                    if success {
                        self.isFacebookSignInSuccessfull = true
                    } else if let error = error {
                        // Handle error
                        print("Error logging in with Facebook: \(error.localizedDescription)")
                    }
                }
            }
        } label: {
            Text("Login with Facebook")
                .foregroundColor(.white)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
        }
        .padding()
        .background(NavigationLink("", destination: ProfileView(), isActive: $isFacebookSignInSuccessfull))
    }
}

#Preview {
    loginAccountFacebookView()
}
