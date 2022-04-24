//
//  SignUpView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    @State private var showSignUpAlert = false
    @State private var createUserSuccess = false
    
    var body: some View {
            VStack{
                    //Text field for email address
                    TextField("Email address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(UIColor.systemGray5))

                    //Text field for password
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(UIColor.systemGray5))
                
                    //Login Button
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else
                        {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                       
                        }, label: {
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .cornerRadius(8)
                    })
                    .disabled(email.isEmpty || password.isEmpty)
                
                    if !viewModel.signUpError.isEmpty {
                        Text("Failed creating account: \(viewModel.signUpError)")
                                    .foregroundColor(.red)
                            }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Create account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
