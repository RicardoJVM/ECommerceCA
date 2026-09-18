//
//  CartViewModel.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class CartViewModel {
    var items: [CartItem] = []
    
    private let getCartUseCase: GetCartUseCase

    init(getCartUseCase: GetCartUseCase) {
        self.getCartUseCase = getCartUseCase
    }

    func loadCart() {
        Task {
            // Sintaxis súper limpia: se llama como una función
            self.items = try await getCartUseCase()
        }
    }
}
