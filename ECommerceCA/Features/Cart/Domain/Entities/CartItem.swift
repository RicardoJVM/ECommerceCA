//
//  CartItem.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id: String
    let name: String
    let price: Double
    var quantity: Int
}
