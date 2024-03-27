//
//  FirstView.swift
//  TheLadder
//
//  Created by Amir Hamza on 27/03/2024.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    FirstView()
}
