//
//  Utilities.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/14/24.
//

import Foundation
import UIKit

class Utilities {
    public static var shared = Utilities()
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }

        return root
    }
}

struct UserModel: Identifiable, Codable {
    var id: String
    var fullName: String
    var email: String
    var dob: String
    var contact: String
}
