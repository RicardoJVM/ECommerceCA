//
//  CartMainView.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import SwiftUI

struct CartMainView: View {
    @State private var viewModel: CartViewModel

    // Inyección de dependencias mediante la composición de Clean Architecture
    init(viewModel: CartViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.items) { item in
                        HStack {
                            Text(item.name).font(.headline)
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }
                }
            }
            .navigationTitle("Carrito Clean")
            .onAppear {
                viewModel.loadCart()
            }
        }
    }
}

// COMPOSICIÓN ROOT (Donde se conectan las piezas para producción)
#Preview {
    let dataSource = CartRemoteDataSource()
    let repository = CartRepository(remoteDataSource: dataSource)
    let useCase = GetCartUseCase(repository: repository)
    let viewModel = CartViewModel(getCartUseCase: useCase)
    
    return CartMainView(viewModel: viewModel)
}
