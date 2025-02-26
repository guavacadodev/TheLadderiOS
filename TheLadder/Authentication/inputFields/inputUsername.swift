//
//  inputUsername.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputUsername: View {
    @ObservedObject var viewModel: AuthViewModel
    @Binding var shouldPlayAnimation: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Create A Username")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Text("Your username should be something creative that represents you. It can be a fictional character, or your own name.")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            InputField(text: $viewModel.username, placeholder: "-", title: "Username:")
                .onChange(of: viewModel.username) { name in
                   // viewModel.username = name
                    print("********\(viewModel.username)")
                    defaults.set(viewModel.username, forKey: "user_name")
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

