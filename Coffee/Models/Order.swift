//
//  Order.swift
//  Coffee
//
//  Created by Michael Flowers on 11/13/21.
//
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

/*
 Delete:
 https://island-bramble.glitch.me/clear-orders

 */
import Foundation
enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable {
    case Small
    case Medium
    case Large
}

class Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeSize
}

struct NewOrder: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeSize
}
