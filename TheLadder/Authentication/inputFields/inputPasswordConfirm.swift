//
//  inputPasswordConfirm.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputPasswordConfirm: View {
    @StateObject var viewModel: AuthViewModel
    @Binding var shouldPlayAnimation: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Confirm Your Password:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Text("Please confirm by re-typing the password you just created.")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            InputField(text: $viewModel.confirmPassword, placeholder: "-", title: "Password:")
                .onChange(of: viewModel.confirmPassword) { _ in
                    viewModel.validateForm()
                }
            HStack {
                Spacer()
                LottieSwipeLeftView(shouldPlay: $shouldPlayAnimation)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color("red1"))
            }
            Spacer()
        }
        .padding(.top, 10)
    }
}
