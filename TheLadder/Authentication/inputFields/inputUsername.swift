//
//  inputUsername.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputUsername: View {
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
            InputField(text: .constant(""), placeholder: "-", title: "Username:")
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

