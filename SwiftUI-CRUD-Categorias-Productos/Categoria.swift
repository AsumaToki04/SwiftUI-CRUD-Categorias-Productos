//
//  Categoria.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct Categoria: Identifiable, Codable {
    let id: UUID
    var nombre: String
    var productos: [Producto]
    
    init(id: UUID = UUID(), nombre: String, productos: [Producto]) {
        self.id = id
        self.nombre = nombre
        self.productos = productos
    }
}
