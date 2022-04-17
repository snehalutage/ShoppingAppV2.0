//
//  HomeView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 2
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $selection)
        {
            //For Login View
            SignInView()
            .tabItem
            {
                Image(systemName: "person")
                Label("Login", image: "cart")
                    .font(.system(size: 26))
            }//end LoginSignup View
            .tag(1)
            
            //For Product List
            ProductListView()
            .tabItem
            {
                Image(systemName: "house.fill")
                Label("Home", image: "house.fill")
                    .font(.system(size: 26))
            }//end ProductListView
            .tag(2)
            
            //For Login View
             CartView()
            .tabItem
            {
                Image(systemName: "cart")
                Label("Cart", image: "cart")
                    .font(.system(size: 26))
            }//end Cart View
            .tag(3)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
