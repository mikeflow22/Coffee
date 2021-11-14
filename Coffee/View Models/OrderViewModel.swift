//
//  OrderViewModel.swift
//  Coffee
//
//  Created by Michael Flowers on 11/13/21.
//

import Foundation
//respresents an array of Coffee orders for tableViews
class NewOrderListViewModel {
    var newOrdersViewModel: [NewOrderViewModel]
    
    init(){
        self.newOrdersViewModel = [NewOrderViewModel]()
    }
    
}
extension NewOrderListViewModel {
    //returns one newOrderViewModel object from the array
    func newOrderViewModel(at index: Int) -> NewOrderViewModel {
        return newOrdersViewModel[index]
    }
}
struct NewOrderViewModel {
    let newOrder: NewOrder
}


//represents 1 NewOrder
extension NewOrderViewModel {
    var name: String {
        newOrder.name
    }
    
    var coffeeName: String {
        newOrder.coffeeName
    }
    
    var total: Double {
        newOrder.total
    }
    
    var size: String {
        newOrder.size.rawValue.capitalized
    }
}
