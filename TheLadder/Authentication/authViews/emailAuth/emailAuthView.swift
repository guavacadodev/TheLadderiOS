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
    var body: some View {
        ScrollView {
            VStack {
                Text("Continue With\nEmail")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                InputField(text: $emailAddress, isSecureField: false, placeholder: "-", title: "Email:", contentType: .emailAddress)
                
                InputField(text: $passcode, isSecureField: false, placeholder: "-", title: "Code:", contentType: .emailAddress)
                
            }
        }
    }
}

#Preview {
    emailAuthView()
}
