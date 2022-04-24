//
//  ProductListView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var productListViewModel = ProductListViewModel()
    @State private var selectedCategory = "electronics"
    
    var body: some View
    {
        NavigationView{
            VStack
            {
                Text("Product Categories")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                VStack{
                        Picker("Categories", selection: $selectedCategory)
                        {
                            ForEach(productListViewModel.categories, id: \.self)
                            { value in
                               Text(value)
                                    .font(.caption2)
                                    .fontWeight(.light)
                                    .padding(8)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(10)
                    }//end VStack
                    .task
                    {
                        await productListViewModel.getCategories()
                    }
                    .onChange(of: selectedCategory, perform: {vaue in Task{ await productListViewModel.getProducts(cat: selectedCategory)}})
                Spacer()
                ScrollView(.vertical, showsIndicators: false)
                {
                  VStack(spacing: 20)
                    {
                      ForEach(productListViewModel.products, id: \.id)
                        {
                          product in
                            NavigationLink(destination: ProductDetailView(product: product))
                            {
                                ProductCell(product: product)
                            }
                         }
                     }//end HStack
                     .task
                     {
                       await productListViewModel.getProducts(cat: selectedCategory)
                     }
                }//end ScrollView
                Spacer()
    
            }//end VStack
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }//end NavigationView
    }//end body
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
