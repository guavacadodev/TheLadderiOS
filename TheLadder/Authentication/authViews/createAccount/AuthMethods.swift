//
//  AuthMethods.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/12/24.
//

import SwiftUI

struct AuthMethods: View {
    var isLogin: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                // --- Phone Create Method --- //
                VStack {
                    NavigationLink {
                        if isLogin {
                            phoneAuthView()
                        } else {
                            createAccountView(signInType: .phone)
                            //phoneAuthView()
                        }
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.black)
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(Color.white)
                            Image(systemName: "phone")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                        }
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    }
                }
                // --- Email Create Method --- //
                VStack {
                    NavigationLink {
                        if isLogin {
                            emailAuthView(isLogin: true)
                        } else {
                            createAccountView(signInType: .email)
                            //emailAuthView()
                        }
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.black)
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(Color.white)
                            Image(systemName: "envelope")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                        }
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    }
                }
                // --- Facebook Create Method --- //
                VStack {
                    NavigationLink {
                        if isLogin {
                            loginAccountFacebookView()
                        } else {
                            createAccountView(signInType: .facebook)
                            //loginAccountFacebookView()
                        }
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.black)
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(Color.white)
                            Image("facebook-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                        }
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    }
                }
                // --- Google Create Method --- //
                VStack {
                    NavigationLink {
                        if isLogin {
                            loginAccountGoogleView()
                        } else {
                            createAccountView(signInType: .google)
                            //loginAccountGoogleView()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.black)
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(Color.white)
                            Image("google-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                        }
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    }
                }
                // --- X Create Method --- //
                VStack {
                    NavigationLink {
                        if isLogin {
                            loginAccountXView()
                        } else {
                            createAccountView(signInType: .twitter)
                            //loginAccountXView()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.black)
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(Color.white)
                            Image("x-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                        }
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    }
                }
            }
        }
    }
}

#Preview {
    AuthMethods(isLogin: true)
}
