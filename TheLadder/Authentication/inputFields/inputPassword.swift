//
//  inputPassword.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputPassword: View {
    @Binding var shouldPlayAnimation: Bool
    @State private var password: String = ""
    
    var isPasswordValid: Bool {
        // Perform validation checks
        let characterSet = CharacterSet(charactersIn: "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let containsLettersAndNumbers = password.rangeOfCharacter(from: characterSet) != nil
        let containsSpecialCharacter = password.rangeOfCharacter(from: CharacterSet(charactersIn: "#$%!@")) != nil
        
        return (8...20).contains(password.count) && containsLettersAndNumbers && containsSpecialCharacter
    }
    
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
            
            InputField(text: $password, placeholder: "-", title: "Password:")
            
            VStack {
                HStack {
                    Image(systemName: isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(isPasswordValid ? Color.green : Color.red)
                    Text("8-20 Characters")
                        .font(.caption)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(isPasswordValid ? Color.green : Color.red)
                    Text("Numbers & Letters")
                        .font(.caption)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: isPasswordValid ? "circle.fill" : "circle.fill")
                        .padding(.leading)
                        .foregroundStyle(isPasswordValid ? Color.green : Color.red)
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
