//
//  Product.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable, Hashable
{
    var name = ""
    var id = 0
    var price = 0.0
    var description = ""
    var category = ""
    var url = "None"
    var number = 0
    var rating: Rating
    
    private enum CodingKeys: String, CodingKey
    {
        case name = "title"
        case id = "id"
        case price = "price"
        case description = "description"
        case category = "category"
        case url = "image"
        case rating = "rating"
    }
}//end struct


struct Rating: Codable, Hashable {
    let rate: Double
    let manualCount: Int = Int.random(in: 0...500)
}
    

