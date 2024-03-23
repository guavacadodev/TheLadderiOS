//
//  inputPassword.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputPassword: View {
    @Binding var shouldPlayAnimation: Bool
    @StateObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Create A Password")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Spacer()
            }
            .font(.title)
            .fontWeight(.bold)
            
            HStack {
                Text("Your password is one of the ways we keep your account secure. Do not share your password!")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            
            InputField(text: $viewModel.password, placeholder: "-", title: "Password:")
                .onChange(of: viewModel.password) { newValue in
                    viewModel.isPasswordValid = viewModel.validatePassword() // Update isPasswordValid property
                    viewModel.validateForm() // Validate the entire form
                }
            VStack {
                HStack {
                    Image(systemName: viewModel.isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(viewModel.isPasswordValid ? Color.green : Color.red)
                    Text("8-20 Characters")
                        .font(.caption)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: viewModel.isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(viewModel.isPasswordValid ? Color.green : Color.red)
                    Text("Numbers & Letters")
                        .font(.caption)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: viewModel.isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(viewModel.isPasswordValid ? Color.green : Color.red)
                    Text("1 Special Character ( #$%!@ )")
                        .font(.caption)
                    Spacer()
                }
            }
            .padding(.top, 3)
            
            HStack {
                Spacer()
                LottieSwipeLeftView(shouldPlay: $shouldPlayAnimation)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(shouldPlayAnimation ? Color.green : Color.gray) // Adjust color according to animation state
            }
            .font(.callout)
            
            Spacer()
        }
        .padding(.top, 10)
    }
}
