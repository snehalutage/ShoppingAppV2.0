//
//  ButtonView.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
            Text("SIGN UP")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
