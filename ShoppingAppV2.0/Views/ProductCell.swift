//
//  ProductCell.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct ProductCell: View {
    
    var product : ProductViewModel
    @State var cartList:[ProductViewModel] = []
    @State private var showingAlert = false
    //Number formatter to display the President number in ordinal format
    var formatter: NumberFormatter
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }//end formatter
    
    var body: some View {
        HStack {
        
            AsyncImage(url: URL(string: product.url)) {
                image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.init(UIColor.systemGray5), lineWidth: 0)
            )

            VStack(alignment: .leading, spacing:15) {
                Text(product.name)
                    .font(.caption2)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                
                Text("$\(product.price)")
                    .font(.caption2)
                    .bold()
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                
            }
           // .frame(width: 100, height: 70,alignment: .leading)
        }
        //.padding(4)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: ProductViewModel.default)
            .previewLayout(.sizeThatFits)
    }
}

