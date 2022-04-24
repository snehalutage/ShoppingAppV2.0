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
                HomeView()
                }
            }
            else
            {
                SignInView()
            }
        }
       .navigationTitle("")
       .navigationBarTitleDisplayMode(.inline)
       .navigationBarHidden(true)
        .onAppear{
            viewModel.signedIn = viewModel.iSignedIn
        }
    }//end body
}//end ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

