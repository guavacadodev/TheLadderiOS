//
//  WelcomeView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var shouldPlayAnimation = true
    @State var loginButtonIsPressed: Bool = false
    @State var createAccountButtonIsPressed: Bool = false
    @State private var activeAnimationIndex = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var ladderImageName: String {
        switch activeAnimationIndex {
        case 1:
            return "Ladder-Blue"
        case 2:
            return "Ladder-Yellow"
        case 3:
            return "Ladder-Green"
        default:
            return "Ladder-Red"
        }
    }

    var buttonColor: Color {
        switch activeAnimationIndex {
        case 1:
            return Color("blue1")
        case 2:
            return Color("yellow1")
        case 3:
            return Color("green1")
        default:
            return Color("red1")
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Image(ladderImageName) // Use the computed property
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()

                TabView(selection: $activeAnimationIndex) {
                    LadderAnimation1(shouldPlay: $shouldPlayAnimation)
                        .tag(0)
                    LadderAnimation2(shouldPlay: $shouldPlayAnimation)
                        .tag(1)
                    LadderAnimation3(shouldPlay: $shouldPlayAnimation)
                        .tag(2)
                    LadderAnimation4(shouldPlay: $shouldPlayAnimation)
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onReceive(timer) { _ in
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.activeAnimationIndex = (self.activeAnimationIndex + 1) % 4
                    }
                }
                
                Button(action: {
                    withAnimation {
                        loginButtonIsPressed.toggle()
                    }
                }) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 80)
                        .foregroundColor(Color("black1"))
                        .overlay(
                            Text("Sign In")
                                .foregroundColor(Color("white1"))
                                .font(.system(size:20))
                        )
                }.padding(.horizontal)
                
                Button(action: {
                    withAnimation {
                        createAccountButtonIsPressed.toggle()
                    }
                }) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 80)
                        .foregroundColor(buttonColor) // Use the computed property
                        .overlay(
                            Text("Create Account!")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        )
                }.padding(.horizontal).padding(.bottom,5)
                
                // Conditional UI for Auth Methods
                Group {
                    if loginButtonIsPressed {
                        ZStack {
                            loginAccountAuthMethods()
                                .background(Rectangle().clipShape(RoundedRectangle(cornerRadius: 50)).opacity(0.2))
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.5), value: loginButtonIsPressed)
                    } else if createAccountButtonIsPressed {
                        ZStack {
                            createAccountAuthMethods()
                                .background(Rectangle().clipShape(RoundedRectangle(cornerRadius: 50)).opacity(0.2))
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.5), value: createAccountButtonIsPressed)
                    }
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading: HStack {
                if loginButtonIsPressed || createAccountButtonIsPressed {
                    Button(action: {
                        // Perform your custom back action
                        self.loginButtonIsPressed = false
                        self.createAccountButtonIsPressed = false
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color("black1"))
                            .imageScale(.large)
                    }
                }
            })
        }
    }
}

#Preview {
    WelcomeView()
}
