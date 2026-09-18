//
//  CartRepositoryProtocol.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

protocol CartRepositoryProtocol {
    func fetchCart() async throws -> [CartItem]
}
