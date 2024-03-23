//
//  createAccountView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/12/24.
//

import SwiftUI

struct createAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var shouldPlayAnimation = true
    @StateObject var viewModel = AuthViewModel()
    var body: some View {
        TabView {
            inputUsername(viewModel: viewModel, shouldPlayAnimation: $shouldPlayAnimation)
            inputPassword(shouldPlayAnimation: $shouldPlayAnimation, viewModel: viewModel)
            inputPasswordConfirm(viewModel: viewModel, shouldPlayAnimation: $shouldPlayAnimation)
            inputBirthday(shouldPlayAnimation: $shouldPlayAnimation, viewModel: viewModel)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrowtriangle.backward.fill") // Your custom back button image
                .foregroundColor(Color("red1")) // Color can be what you prefer
        })
        .padding()
    }
}

#Preview {
    createAccountView()
}


