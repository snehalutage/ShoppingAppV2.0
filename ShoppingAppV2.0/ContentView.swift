//
//  ContentView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn
            {
                VStack{
                //Text("You are signed in")
                HomeView()
                
                /*Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Sign Out")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })*/
                }.padding()
            }
            else{
                SignInView()
            }
        }
      /*  .onAppear{
            viewModel.signedIn = viewModel.iSignedIn
        }*/
        
    }//end body
}//end ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
