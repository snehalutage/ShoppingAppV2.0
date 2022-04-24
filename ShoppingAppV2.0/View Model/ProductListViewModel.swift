//
//  ProductListViewModel.swift
//  ShoppingAppV2.0
//
//  Created by Snehal on 4/17/22.
//

import SwiftUI

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    @Published var categories: [String] = []
    @State var path : String = "electronics"
    
    func getProducts(cat category : String) async {
        do {
            print(category)
  
            let urlS = URL(string: "https://fakestoreapi.com/products/category/" + category.replacingOccurrences(of: " ", with: "%20"))
            //print(urlS)
            var products = try await WebService().fetchProducts(url: urlS)
            products.sort {
                $0.id < $1.id
            }
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func getCategories() async {
        
        do {
            var categories = try await WebService().fetchCategories(url: Constants.Urls.categoriesUrl)
            categories.sort {
                $0 < $1
            }
            self.categories = categories
        } catch {
            print(error)
        }
    }
}

struct ProductViewModel : Identifiable, Hashable {
    
    fileprivate var product: Product
    
    var name: String {
        return product.name
    }
    
    var number:Int{
        return product.number
    }
    
    var id: Int {
        return product.id
    }
    
    var price: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: product.price)) ?? ""
    }
    
    var description: String {
        return product.description
    }
    
    var category: String {
        return product.category
    }
        
    var url: String {
        return product.url
    }
    
    static var `default`: ProductViewModel {
        let product = Product(name: "Mens Cotton Jacket", id: 3, price:55.99, description: "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.", category: "men's clothing", url: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg")
        return ProductViewModel(product: product)
    }
}


enum ProductListEndpoint: String, CaseIterable {
    
    case all = "All"
    case jewelery = "Jewelery"
    case electronics = "electronics"
    case men = "men's clothing"
    case women = "women's clothing"
    
    var description: String {
        switch self {
        case .all: return "/"
        case .jewelery: return "/category/jewelery"
        case .electronics: return "/category/electronics"
        case .men: return "/category/men's%20clothing"
        case .women: return "/category/women's%20clothing"
        }
    }
}
