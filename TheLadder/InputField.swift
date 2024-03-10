//
//  InputField.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/11/24.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    var isSecureField = false
    var placeholder = ""
    var title = ""
    var contentType: UITextContentType? = .emailAddress
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical, 10)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 16))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .textContentType(contentType)
                
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 16))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .textContentType(.emailAddress)
            }
            
            Divider()
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    InputField(text: .constant(""), placeholder: "you@email.com", title: "Email Address")
}

