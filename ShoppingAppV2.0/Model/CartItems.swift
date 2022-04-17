//
//  CartItems.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import Foundation

class  CartItems: ObservableObject {
    @Published var cartProduct: [ProductViewModel] = []
  
    var total : Double = 0.0
    func addItem(item: ProductViewModel)
    {
        cartProduct.append(item)
    }

    func totalPrice() -> Double{
        for product in cartProduct {
            total = Double(product.number) * Double(product.price)!
        }
        return total
    }
   
}
