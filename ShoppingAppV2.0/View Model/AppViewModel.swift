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
    @Published var signUpError = ""
    
    var iSignedIn: Bool{
        return auth.currentUser != nil
    }
    @Published var cartProduct: [ProductViewModel:Int] = [:]
    
    
    //User SignIn
    func signIn(email: String, password: String)
    {
        auth.signIn(withEmail: email,
                    password: password){[weak self] result, error in
           guard result != nil, error == nil else{
                self?.signInError = "\(error!.localizedDescription)"
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    //User Signup
    func signUp(email: String, password: String)
    {

        auth.createUser(withEmail: email, password: password){[weak self]result, error  in
            guard result != nil, error == nil else{
                self?.signUpError = "\(error!.localizedDescription)"
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
    
    
    func addItem(item: ProductViewModel, count: Int)
    {
        cartProduct[item] = count
    }

    func totalPrice() -> Double{
        var total = 0.0
        for (product,count) in cartProduct {
            total += Double(count) * Double(product.price)!
        }
        return total
    }
}

