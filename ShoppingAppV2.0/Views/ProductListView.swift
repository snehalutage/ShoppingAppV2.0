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
    var images:[String:String] = ["electronics" :"electronics", "jewelery":"jwelery", "men's clothing":"mens", "women's clothing":"women"]
    
    var body: some View
    {
        NavigationView{
            VStack
            {
                /*Text("Enjoy Shopping!!")
                    .font(.title)
                    .fontWeight(.bold)*/
                Text("Product Categories")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack{
                        Picker("Categories", selection: $selectedCategory)
                        {
                            ForEach(productListViewModel.categories, id: \.self)
                            { value in
                               Text(value)
                                    .font(.caption2)
                                    .fontWeight(.light)
                                    .padding(8)
                               /* Image(images[value]!)
                                    .resizable()
                                    .scaledToFit()
                                   // .frame(width: 5.0, height: 5.0)
                                    .border(.black)
                                    .background(Color.green)
                                    .padding(.bottom, 5)
                                    .padding(.top, 5)*/
                            }//end ForEach
                        }
                        .pickerStyle(.segmented)
                        /*.shadow(color: .gray, radius: 10, x: 10, y: 10)
                        .padding(10)*/
                    }//end VStack
                    .task
                    {
                        //print(selectedCategory)
                        await productListViewModel.getCategories()
                    }
                    .onChange(of: selectedCategory, perform: {vaue in Task{ await productListViewModel.getProducts(cat: selectedCategory)}})
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false)
                {
                  HStack(spacing: 20)
                    {
                      ForEach(productListViewModel.products, id: \.id)
                        {
                          product in
                            NavigationLink(destination: ProductDetailView(product: product))
                            {
                                ProductCell(product: product)
                            }
                          //product in ProductCell(product: product)
                         }
                     }//end HStack
                     .task
                     {
                       await productListViewModel.getProducts(cat: selectedCategory)
                     }
                }//end ScrollView
                Spacer()
    
            }//end VStack
            //.navigationTitle("Products")
            //.navigationBarTitleDisplayMode(.inline)
        }//end NavigationView
    }//end body
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
