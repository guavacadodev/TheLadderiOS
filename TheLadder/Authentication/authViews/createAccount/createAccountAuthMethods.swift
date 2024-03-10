//
//  createAccountAuthMethods.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/12/24.
//

import SwiftUI

struct createAccountAuthMethods: View {
    var body: some View {
        ZStack {
                HStack(spacing: 5) {
                    // --- Phone Create Method --- //
                    VStack {
                        NavigationLink {
                            NavigationView {
                                createAccountView()
                                phoneAuthView()
                            }
                            .navigationBarBackButtonHidden(true)
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
                            createAccountView()
                            emailAuthView()
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
                            createAccountView()
                            loginAccountFacebookView()
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
                            createAccountView()
                            loginAccountGoogleView()
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
                            createAccountView()
                            loginAccountXView()
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
    createAccountAuthMethods()
}
