//
//  CartView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var isCartEmpty = true
    
    var body: some View {
        let keys = viewModel.cartProduct.map{$0.key}
        
        VStack{
            
            Text("Cart Details")
                .font(.title2)
                .bold()
            
            List{
                Section
                {
                        
                    ForEach(keys){ item in
                        HStack(alignment: .top, spacing: 15){
                            AsyncImage(url: URL(string: item.url)) {
                                image in
                                image.resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100, alignment: .leading)
                            VStack(alignment: .leading, spacing:15){
                            Text(item.name)
                                    .font(.caption2)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                            
                            Text("Price: $\(item.price)")
                                    .font(.caption2)
                                    .fontWeight(.light)

                                Text("Count: \(viewModel.cartProduct[item]!)")
                                    .font(.caption2)
                                    .fontWeight(.light)
  
                            }
                        }
                    }
                }
            }
            Button(action: {
                print("Confirm Order \(viewModel.totalPrice())")
            })
            {
                NavigationLink(destination: OrderConfirmView()) {
                    HStack{
                        Image(systemName: "creditcard")
                        Text("Confirm Order")
                            .font(.headline)
                    }
                }
               
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
            .disabled(viewModel.cartProduct.count == 0 ? true : false)
            Spacer()
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(AppViewModel())
            
    }
}

