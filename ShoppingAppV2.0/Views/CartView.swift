//
//  CartView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartItems
    @EnvironmentObject var viewModel: AppViewModel
    
    var totalCharge:String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(cart.totalPrice())
        return formatter.string(from:NSNumber(value: total)) ?? "$0"
    }
    
    var body: some View {
        
        VStack{
            
            Text("Cart Details")
            
            List{
                Section
                {
                    ForEach(cart.cartProduct){ item in
                        HStack(alignment: .top, spacing: 15){
                            AsyncImage(url: URL(string: item.url)) {
                                image in
                                image.resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80, alignment: .leading)
                            VStack(alignment: .leading, spacing:15){
                            Text(item.name)
                                    .font(.caption2)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                            
                            Text("Price: $\(item.price)")
                                    .font(.caption2)
                                    .fontWeight(.light)

                                Text("Count: \(item.number)")
                                    .font(.caption2)
                                    .fontWeight(.light)
  
                            }
                        }
                    }
                }
                Section{
                    Text("Total amount: \(totalCharge)")
                }
              
               /* Section
                {
                    NavigationLink(destination: Text("checkout")){
                        Text("Place Order")
                    }
                }*/
            }
            Button(action: {print("Confirm Order \(cart.totalPrice())")})
            {
                HStack{
                    Image(systemName: "creditcard")
                    Text("Confirm Order")
                        .font(.caption)
                        .padding(8)
                }
                
            }.font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
        
        }.onAppear{
            viewModel.signedIn = viewModel.iSignedIn
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartItems())
            
    }
}

