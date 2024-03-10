//
//  inputPassword.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputPassword: View {
    @Binding var shouldPlayAnimation: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Create A Password")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Spacer()
            }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Your password is one of the ways we keep your account secure. Do not share your password!")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            InputField(text: .constant(""), placeholder: "-", title: "Password:")
            VStack {
                HStack {
                    Image(systemName: "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(Color("red1"))
                    Text("8-20 Characters")
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(Color("red1"))
                    Text("Numbers & Letters")
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(Color("red1"))
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
                    .foregroundStyle(Color("red1"))
            }
            .font(.callout)
            Spacer()
        }
        .padding(.top, 10)
    }
}
