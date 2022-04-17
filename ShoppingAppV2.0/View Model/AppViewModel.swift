//
//  AppViewModel.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject
{
    let auth = Auth.auth()
    @Published var signedIn = false
    @Published var signInError = ""
    var iSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    //User SignIn
    func signIn(email: String, password: String)
    {
        auth.signIn(withEmail: email,
                    password: password){[weak self] result, error in
           /* guard result != nil, error == nil else{
                return
            }*/
            if let x = error {
                  let err = x as NSError
                  switch err.code {
                  case AuthErrorCode.wrongPassword.rawValue:
                      self?.signInError = "Wrong password!"
                  case AuthErrorCode.invalidEmail.rawValue:
                      self?.signInError = "Invalid email id"
                  case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                      self?.signInError = "Account already exists"
                  default:
                      self?.signInError = "Unknown error: \(err.localizedDescription)"
                  }
            }
            else
            {
                //Success
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
            }
            
        }
    }
    
    //User Signup
    func signUp(email: String, password: String)
    {
        auth.createUser(withEmail: email, password: password){[weak self]result, error  in
            guard result != nil, error == nil else{
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    //signout function
    func signOut()
    {
        try? auth.signOut()
        self.signedIn = false
    }
}

