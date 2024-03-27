//
//  TheLadderApp.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/10/24.
//

import SwiftUI
import Firebase

let defaults = UserDefaults.standard

@main
struct TheLadderApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    WelcomeView()
}
