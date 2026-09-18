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
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    private let getCartUseCase: GetCartUseCase

    init(getCartUseCase: GetCartUseCase) {
        self.getCartUseCase = getCartUseCase
    }

    func loadCart() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                self.items = try await getCartUseCase()
                self.isLoading = false
            } catch {
                self.errorMessage = "Error al cargar el carrito"
                self.isLoading = false
            }
        }
    }
}
