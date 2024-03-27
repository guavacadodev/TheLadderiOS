//
//  AuthViewModel.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/14/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase
import GoogleSignIn
import FacebookLogin

@MainActor
class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var dateOfBirth: String = "March 2 2013"
    @Published var isFormValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var currentUser: UserModel?
    @Published var userSession: User?
    @Published var dataFetched: Bool = false
    @Published var isGoogleSignInSuccessfull: Bool = false
    @Published var isFacebookSignInSuccessfull: Bool = false
    @Published var isTwitterSignInSuccessfull: Bool = false
    
    var userNameString = ""
    var finalPassword = ""
    var dob = ""

    static let shared = AuthViewModel()
    
    init() {
       // signOutUser()
        self.userSession = Auth.auth().currentUser
//        Task {
//            fetchUser { success, error in
//                if success {
//                    print("User data fetched successfully")
//                } else if let error = error {
        //                    print("Error fetching user data: \(error.localizedDescription)")
        //                }
        //            }
        //        }
    }

       func validateForm() {
           let isUsernameValid = !username.isEmpty
           isPasswordValid = validatePassword()
           let isConfirmPasswordValid = !confirmPassword.isEmpty && confirmPassword == password
           let isDOBValid = dateOfBirth != ""

           isFormValid = isUsernameValid && isPasswordValid && isConfirmPasswordValid && isDOBValid
           print("isFormValid *************** \(isFormValid)")
       }

       internal func validatePassword() -> Bool {
           // Perform password validation checks here
           let characterSet = CharacterSet(charactersIn: "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
           let containsLettersAndNumbers = password.rangeOfCharacter(from: characterSet) != nil
           let containsSpecialCharacter = password.rangeOfCharacter(from: CharacterSet(charactersIn: "#$%!@")) != nil

           let isPasswordLengthValid = (8...20).contains(password.count)
           let isPasswordValid = isPasswordLengthValid && containsLettersAndNumbers && containsSpecialCharacter

           return isPasswordValid
       }
    
    //email signIn
    func signInUserWithEmail(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                completion(false, error)
            } else if let result = result {
                self.userSession = result.user
                // Fetch user and update UI only if fetchUser is successful
                self.fetchUser { success, fetchError in
                    if success {
                        completion(true, nil)
                    } else {
                        print("Error fetching user: \(fetchError?.localizedDescription ?? "Unknown error")")
                        completion(false, fetchError)
                    }
                }
            }
        }
    }
    
    
    func logInWithFacebook(completion: @escaping (Bool, Error?) -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: Utilities.shared.getRootViewController()) { (result, error) in
            if let error = error {
                print("Facebook login failed with error: \(error.localizedDescription)")
                completion(false, error)
            } else if let result = result, !result.isCancelled {
                // Login successful, access token can be fetched here
                if let accessToken = AccessToken.current {
                    let tokenString = accessToken.tokenString
                    print("Access Token: \(tokenString)")
                    
                    // Authenticate with Firebase using Facebook credentials
                    let credentials = FacebookAuthProvider.credential(withAccessToken: tokenString)
                    
                    // Use the credential to authenticate with Firebase
                    Auth.auth().signIn(with: credentials) { authResult, error in
                        if let error = error {
                            print("Firebase authentication failed with error: \(error.localizedDescription)")
                            completion(false, error)
                        } else {
                            // Firebase authentication successful
                            
                            // Additional actions after Firebase authentication
                            let userData = UserModel(id: authResult?.user.uid ?? "...",
                                                     fullName: authResult?.user.displayName ?? "...",
                                                     email: authResult?.user.email ?? "...", dob: "",
                                                     contact: authResult?.user.phoneNumber ?? "...")
                            
                            self.userSession = authResult?.user
                            do {
                                let encodedData = try Firestore.Encoder().encode(userData)
                                Firestore.firestore().collection("users").document(userData.id).setData(encodedData) { error in
                                    if let error = error {
                                        print("Error setting user data: \(error.localizedDescription)")
                                        completion(false, error)
                                    } else {
                                        // Firestore operation successful
                                        Task {
                                            self.fetchUser { success, error in
                                                if success {
                                                    self.isFacebookSignInSuccessfull = true
                                                    print("User data fetched successfully")
                                                } else if let error = error {
                                                    print("Error fetching user data: \(error.localizedDescription)")
                                                }
                                            }
                                                                                    
                                          
                                        }
                                    }
                                }
                            } catch {
                                print("Error handling user data: \(error.localizedDescription)")
                                completion(false, error)
                            }
                        }
                    }
                }
            } else {
                print("Facebook login was cancelled.")
                completion(false, nil)
            }
        }
    }
    
    func signInWithGoogle(password: String, username: String, dob: String) async throws {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: Utilities.shared.getRootViewController())
            
            guard let idToken = result.user.idToken?.tokenString else {return}
            let accessToken = result.user.accessToken.tokenString
        
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            do {
                let authResult = try await Auth.auth().signIn(with: credential)
                let userData = UserModel(id: authResult.user.uid, fullName: authResult.user.displayName ?? "...", email: authResult.user.email ?? "...", dob: dob, contact: authResult.user.phoneNumber ?? "...")
                
                self.userSession = authResult.user
                let encodedData = try Firestore.Encoder().encode(userData)
                try await Firestore.firestore().collection("users").document(userData.id).setData(encodedData)
                fetchUser { success, error in
                    if success {
                        self.isGoogleSignInSuccessfull = true
                        print("User data fetched successfully")
                    } else if let error = error {
                        print("Error fetching user data: \(error.localizedDescription)")
                    }
                }
      
            } catch {
                print("Error signing in: \(error.localizedDescription)")
            }
        } catch {
            print("Error signing in: \(error.localizedDescription)")
        }
    }
    
    func signInWithTwitter() {
        //Replace this access token with origin twitter access token from twitter developer dashboard
        let accessToken = "1760251756112474113-Q6B3OTqsXquBSpZdn34d42lBLC2VEl"
        
        let twitterAuthProvider = OAuthProvider.credential(withProviderID: "twitter.com", accessToken: accessToken)
        
        Auth.auth().signIn(with: twitterAuthProvider) { authResult, error in
            if let error = error {
                print("Error signing in with Twitter: \(error.localizedDescription)")
            } else if let user = authResult?.user {
                print("Successfully signed in with Twitter. UserID: \(user.uid)")
                
                // Access user details
                let displayName = user.displayName
                let email = user.email
                let photoURL = user.photoURL
                
                // Use user details as needed
                print("User Display Name: \(displayName ?? "N/A")")
                print("User Email: \(email ?? "N/A")")
                print("User Photo URL: \(photoURL?.absoluteString ?? "N/A")")
                
                // You can update your UI or perform other actions based on user details
            }
        }
    }

    //create User With Email
    func createUserWithEmail(email: String, password: String, username: String, dob: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userData = UserModel(id: result.user.uid, fullName: username, email: email, dob: dob, contact: "")
            self.userSession = result.user
            let encodedData = try Firestore.Encoder().encode(userData)
            try await Firestore.firestore().collection("users").document(userData.id).setData(encodedData)
            fetchUser { success, error in
                if success {
                    print("User data fetched successfully")
                } else if let error = error {
                    print("Error fetching user data: \(error.localizedDescription)")
                }
            }
        } catch {
            print("error = \(error.localizedDescription)")
        }
        
    }
    
    //Creates an account for authentication using a mobile phone number.
    func signInPhoneNumber(_ phoneNumber: String, completion: @escaping (Result<String, Error>) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                completion(.failure(error))
            } else if let verificationID = verificationID {
                UserDefaults.standard.setValue(verificationID, forKey: "authVerificationID")
                completion(.success("Verification Code Sent!"))
            }
        }
    }

    //This signs user in with a previously stored phone number, from the above function.
    func signInWithVerificationCode(_ verificationCode: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let verificationID = UserDefaults.standard.value(forKey: "authVerificationID") as? String else {
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Verification ID not found"])))
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("User authenticated successfully"))
                let userData = UserModel(id: authResult?.user.uid ?? "...", fullName: authResult?.user.displayName ?? "...", email: authResult?.user.email ?? "...", dob: "", contact: authResult?.user.phoneNumber ?? "...")
                self.userSession = authResult?.user
                do {
                    let encodedData = try Firestore.Encoder().encode(userData)
                    Firestore.firestore().collection("users").document(userData.id).setData(encodedData) { error in
                        if let error = error {
                            print("Error setting user data: \(error.localizedDescription)")
                            completion(.failure(error))
                        } else {
                            // Firestore operation successful
                            Task {
                                self.fetchUser { success, error in
                                    if success {
                                        
                                        completion(.success("User data fetched successfully"))
                                        print("User data fetched successfully")
                                    } else if let error = error {
                                        print("Error fetching user data: \(error.localizedDescription)")
                                        completion(.failure(error))
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print("Error handling user data: \(error.localizedDescription)")
                    completion(.failure(error))
                }
                
            }
        }
    }
    
    //SignOut User
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            self.userSession = nil
            
        } catch {
            print("Error, try again")
        }
    }
    
    // Fetch User
    func fetchUser(completion: @escaping (Bool, Error?) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(false, nil)
            return
        }

        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                completion(false, error)
            } else if let snapshot = snapshot, snapshot.exists {
                do {
                    self.currentUser = try snapshot.data(as: UserModel.self)
                    self.dataFetched = true
                    completion(true, nil)
                } catch {
                    print("Error decoding user data: \(error.localizedDescription)")
                    completion(false, error)
                }
            } else {
                // User document does not exist
                self.currentUser = nil
                self.dataFetched = false
                completion(false, nil)
            }
        }
    }
    
}
