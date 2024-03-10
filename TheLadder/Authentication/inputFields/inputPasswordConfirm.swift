//
//  inputPasswordConfirm.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputPasswordConfirm: View {
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
            InputField(text: .constant(""), placeholder: "-", title: "Password:")
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
