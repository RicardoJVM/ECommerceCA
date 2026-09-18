//
//  CartViewFactory.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

// Factory dedicada a la Feature
enum CartFactory {
    @MainActor
    static func makeCartView() -> CartMainView {
        let dataSource = CartRemoteDataSource()
        let repository = CartRepository(remoteDataSource: dataSource)
        let useCase = GetCartUseCase(repository: repository)
        let viewModel = CartViewModel(getCartUseCase: useCase)
        
        return CartMainView(viewModel: viewModel)
    }
}
