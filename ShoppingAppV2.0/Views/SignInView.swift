//
//  SignInView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    @State private var showAlert = false
    
    var body: some View {
            VStack
            {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(150)
                    //Spacer()
 
                
                VStack{
                    //Text field for email address
                    HStack
                    {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                        TextField("Email address", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    .padding(10)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                        
                    //Text field for password
                    HStack
                    {
                        Image(systemName: "lock")
                            .foregroundColor(.secondary)
                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    .padding(10)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                    Spacer()
                    //Login Button
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else
                        {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                        if(viewModel.signInError != ""){
                            showAlert = true
                        }
                    }, label: {
                        SignInButtonView()
                    })
                        .alert("\(viewModel.signInError)", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            }
                    
                    NavigationLink("Create account", destination: SignUpView())
                        .padding()
                    
                    Spacer()
                }
            }
            .padding()
    }
}

struct SignInButtonView: View {
    var body: some View {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

