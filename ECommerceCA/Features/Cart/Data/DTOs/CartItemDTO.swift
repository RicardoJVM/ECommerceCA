//
//  CartItemDTO.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

struct CartItemDTO: Decodable {
    let raw_id: String
    let item_title: String
    let cost: Double
    let stock_count: Int

    // Mapeo explicito hacia el Dominio
    func toDomain() -> CartItem {
        CartItem(
            id: raw_id,
            name: item_title,
            price: cost,
            quantity: stock_count
        )
    }
}
