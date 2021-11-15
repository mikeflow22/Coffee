//
//  AddCoffeeOrderViewModel.swift
//  Coffee
//
//  Created by Michael Flowers on 11/14/21.
//

import Foundation

/*
 Post:
 https://island-bramble.glitch.me/orders
 Method: POST
 Body:
 name: String
 coffeeName: String
 total: Double
 size: String
 */

//will use this to populate the AddOrder view controller
struct AddCoffeeOrderViewModel {
    var name: String?
    var coffeeName: String?
    var selectedType: String?
    var selectedSize: String?
    var total: Double?
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue }
    }
}
