//
//  OrderConfirmView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct OrderConfirmView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var totalCharge:String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(viewModel.totalPrice())
        return formatter.string(from:NSNumber(value: total)) ?? "$0"
    }
    
    var body: some View {
        VStack{
            Text("Summary")
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .bold()
            Spacer()
            Text("Your Order Total is : \(totalCharge)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Thank you for shopping!")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
            
            Image(systemName: "face.smiling")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(150)
            Spacer()
        }
            
        
    }
}

struct OrderConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmView()
    }
}
