//
//  ProfileVIew.swift
//  TheLadder
//
//  Created by Amir Hamza on 26/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            ProgressView()
                .onAppear {
                    Task {
                        viewModel.fetchUser { success, error in
                            if success {
                                isLoading = false
                                print("User data fetched successfully")
                            } else if let error = error {
                                viewModel.signOutUser()
                                print("Error fetching user data: \(error.localizedDescription)")
                            }
                        }
                    }
                }
        } else {
            if let user = viewModel.currentUser {
                List {
                    Section() {
                        HStack {
                            Text("User Profile")
                                .foregroundColor(.black)
                                .font(.system(size: 30, weight: .heavy))
                            Spacer()
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                                    .opacity(0.3)
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    
                    Section("Profile Details") {
                        Button(action: {
                            
                        }, label: {
                            Text("User Name:   \(user.fullName)")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Email:   \(user.email)")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.gray)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Phone No:   \(user.contact)")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.gray)
                        })
                        
                    }
                    
                    Section("Settings") {
                        Button(action: {
                            viewModel.signOutUser()
                        }, label: {
                            Text("LogOut")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.red)
                        })
                    }
                }
            }
        }
    }

}

#Preview {
    ProfileView()
}


