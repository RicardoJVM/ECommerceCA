//
//  CartRemoteDataSource.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

final class CartRemoteDataSource: CartRemoteDataSourceProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchCartJSON() async throws -> [CartItemDTO] {
        let mockJSON = """
        [
            {"raw_id": "101", "item_title": "MacBook Pro", "cost": 1999.99, "stock_count": 1},
            {"raw_id": "102", "item_title": "Magic Mouse", "cost": 79.00, "stock_count": 2},
            {"raw_id": "103", "item_title": "Headphones awesome", "cost": 500.00, "stock_count": 10},
            {"raw_id": "104", "item_title": "Mouse pad bcb", "cost": 5.00, "stock_count": 0}
        ]
        """.data(using: .utf8)!

        return try JSONDecoder().decode([CartItemDTO].self, from: mockJSON)
    }
}
