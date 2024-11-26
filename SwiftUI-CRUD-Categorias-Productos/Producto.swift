//
//  Producto.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct Producto: Identifiable, Codable {
    let id: UUID
    var nombre: String
    
    init(id: UUID = UUID(), nombre: String) {
        self.id = id
        self.nombre = nombre
    }
}
