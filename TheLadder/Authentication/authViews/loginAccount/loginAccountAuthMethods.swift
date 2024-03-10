//
//  AuthMethods.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI

struct loginAccountAuthMethods: View {
    var body: some View {
        ZStack {
                HStack(spacing: 5) {
                    // --- Phone Sign In Method --- //
                    VStack {
                        NavigationLink {
                            phoneAuthView()
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
                    // --- Email Sign In Method --- //
                    VStack {
                        NavigationLink {
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
                    // --- Twitter Sign In Method --- //
                    VStack {
                        NavigationLink {
                            // Direct user to X / Twitter UI to sign in for authentication.
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
                    // --- Google Sign In Method --- //
                    VStack {
                        NavigationLink {
                            // Direct user to Google to sign in for authentication.
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
                    // --- X Sign In Method --- //
                    VStack {
                        NavigationLink {
                            // Direct user to X / Twitter UI to sign in for authentication.
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
    loginAccountAuthMethods()
}
