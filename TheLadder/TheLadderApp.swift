//
//  TheLadderApp.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI
import Firebase

@main
struct TheLadderApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    WelcomeView()
}
