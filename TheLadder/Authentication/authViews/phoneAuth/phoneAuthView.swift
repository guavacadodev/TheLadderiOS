//
//  phoneAuthView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/14/24.
//

import SwiftUI

struct phoneAuthView: View {
    @State private var passcode: String = ""
    @State private var mobileNumber: String = ""
    @State private var isSignUpButtonEnabled: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Continue With\nMobile Number")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                InputField(text: $mobileNumber, isSecureField: false, placeholder: "-", title: "Mobile Number:", contentType: .telephoneNumber)
                
                InputField(text: $passcode, isSecureField: false, placeholder: "-", title: "Code:", contentType: .telephoneNumber)
                
                Button {
                    if mobileNumber.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        viewModel.signInPhoneNumber(mobileNumber) { result in
                            switch result {
                            case .success(let message):
                                isSignUpButtonEnabled = true
                                print(message)
                            case .failure(let error):
                                print("Error sending verification code: \(error.localizedDescription)")
                            }
                        }
                        
                    } else {
                        print("Error!")
                    }
                } label: {
                    Text("Request Code")
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(.vertical)
                .padding(.horizontal)
                .disabled(mobileNumber.trimmingCharacters(in: .whitespacesAndNewlines) != "" ? false : true )
                .opacity(mobileNumber.trimmingCharacters(in: .whitespacesAndNewlines) != "" ? 1.0 : 0.5)
                
                Button {
                    if passcode.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        viewModel.signInWithVerificationCode(passcode) { result in
                            switch result {
                            case .success(let message):
                                print(message)
                            case .failure(let error):
                                print("Error verifying code: \(error.localizedDescription)")
                            }
                        }
                    } else {
                        print("Confirm your password again!")
                    }
                    
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(.vertical)
                .padding(.horizontal)
                .disabled(!isSignUpButtonEnabled)
                .opacity(isSignUpButtonEnabled ? 1.0 : 0.5)
                
//                Button(action: {
//                    dismiss()
//                }, label: {
//                    HStack {
//                        Text("Already have an account?")
//                            .font(.system(size: 13, weight: .semibold))
//                            .foregroundColor(.gray)
//                        Text("Login")
//                            .font(.system(size: 13, weight: .bold))
//                            .foregroundColor(.black.opacity(0.6))
//                    }
//                })
                
                
                Spacer()
            }
            .padding()
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowtriangle.backward.fill") // Your custom back button image
                    .foregroundColor(Color("red1")) // Color can be what you prefer
            })
            
        }
    }
}

#Preview {
    phoneAuthView()
}
