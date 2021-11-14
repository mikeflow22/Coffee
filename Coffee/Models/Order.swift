//
//  Order.swift
//  Coffee
//
//  Created by Michael Flowers on 11/13/21.
//

import Foundation
enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable {
    case small
    case medium
    case large
}

class Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeSize
}
