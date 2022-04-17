//
//  WebService.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import Foundation

class WebService {
    
    
    /// Fetches and decodes JSON for products.
    /// - Parameter url: URL from which to fetch the data.
    /// - Returns: An array of products or an empty array in case of an error.
    /// - Throws: If the data fetched isn’t valid JSON, this method throws the `DecodingError.dataCorrupted(_:)`  error.
    ///           If a value within the JSON fails to decode, this method throws the corresponding error.
    func fetchProducts(url: URL?) async throws -> [Product] {
        
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try? JSONDecoder().decode([Product].self, from: data)
        return products ?? []
    }
    
    func fetchCategories(url: URL?) async throws -> [String] {
        
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let categories = try? JSONDecoder().decode([String].self, from: data)
        return categories ?? []
    }
    
}


