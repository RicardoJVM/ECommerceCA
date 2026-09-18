//
//  CartRepository.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

final class CartRepository: CartRepositoryProtocol {
    private let remoteDataSource: CartRemoteDataSourceProtocol

    init(remoteDataSource: CartRemoteDataSourceProtocol = CartRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchCart() async throws -> [CartItem] {
        // 1. Llama al DataSource
        let dtos = try await remoteDataSource.fetchCartJSON()
        
        // 2. Transforma los DTOs a Entidades Puras de Dominio
        return dtos.map { $0.toDomain() }
    }
}

///El Repositorio es el Orquestador de Datos (Capa de Infraestructura/Acceso a Datos)
/**
 Ejemplo: Cuando el Use Case le pide getCart(), el Repositorio decide la estrategia:
     "¿Tengo los datos en memoria/caché? Se los devuelvo."
     "¿No hay red? Los leo del LocalDataSource (SwiftData/SQLite)."
     "¿Hay red? Los pido al RemoteDataSource (API REST), los guardo en la base de datos local y los devuelvo."
 */
