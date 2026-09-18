//
//  CartRemoteDataSourceProtocol.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

protocol CartRemoteDataSourceProtocol {
    func fetchCartJSON() async throws -> [CartItemDTO]
}
