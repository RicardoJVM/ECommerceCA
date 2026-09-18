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
            {"raw_id": "102", "item_title": "Magic Mouse", "cost": 79.00, "stock_count": 2}
        ]
        """.data(using: .utf8)!

        return try JSONDecoder().decode([CartItemDTO].self, from: mockJSON)
    }
}
