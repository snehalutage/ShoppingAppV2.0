//
//  ProductDetailView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct ProductDetailView: View{
    let product: ProductViewModel
    @State private var showingAlert = false
    @State private var zeroItemAlert = false
    @State private var totalItems = 0
    //@EnvironmentObject var cart: CartItems
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(product.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            AsyncImage(url: URL(string: product.url)) {
                image in
                image.resizable()
                .scaledToFit()
                .cornerRadius(12)
            } placeholder: {
               // ProgressView()
                Color.gray
            }
            
            Text("$\(product.price)")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.leading)
            
          /*  Text(product.category)
                .font(.title3)
                .bold()
                .multilineTextAlignment(.leading)*/

            Text(product.description)
                .font(.caption2)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            Stepper("Quantity of items : \(totalItems)", value: $totalItems, in: 0...10, step: 1)
                .padding(.horizontal)

            
            Button(action: {
                if (totalItems != 0){
                    viewModel.addItem(item: product, count: totalItems)
                    showingAlert = true
                }
                else
                {
                    zeroItemAlert = true
                }
            })
            {
                Text("Add to cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            .alert("Item added to cart", isPresented: $showingAlert) {
                Button("OK") { }
            }
            .alert("Please select quantity", isPresented: $zeroItemAlert) {
                Button("OK") { }
            }
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ProductViewModel.default)
          //  .environmentObject(CartItems())
            .environmentObject(AppViewModel())
    }
}
