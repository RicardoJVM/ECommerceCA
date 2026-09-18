//
//  GetCartUseCase.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

struct GetCartUseCase {
    private let repository: CartRepositoryProtocol

    init(repository: CartRepositoryProtocol) {
        self.repository = repository
    }

    // ⚡️ Permite invocar la instancia directamente como una función
    func callAsFunction() async throws -> [CartItem] {
        let items = try await repository.fetchCart()
        return items.filter { $0.quantity > 0 }
    }
}

///El Use Case es estrictamente para lógica de negocio
/**
 Ejemplo: Si el usuario presiona "Aplicar Cupón", el Use Case coordina:
     Pedir el carrito al repositorio.
     Validar si el cupón expiró (regla de negocio).
     Calcular el $15\%$ de descuento (regla de negocio).
     Guardar el nuevo total.
*/

/**
 En repository pattern la logica del negocio la absorve el viewmodel o encapsulada en la entidad
 struct CartItem {
     let price: Double
     var quantity: Int
     
     // Regla de negocio encapsulada en el modelo
     var subtotal: Double {
         price * Double(quantity)
     }
 }
 */
