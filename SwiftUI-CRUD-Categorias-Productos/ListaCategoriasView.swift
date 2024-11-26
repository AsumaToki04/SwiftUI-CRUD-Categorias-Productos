//
//  ListaCategoriasView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct ListaCategoriasView: View {
    @ObservedObject var modelo: ModeloCategoria
    
    var body: some View {
        VStack {
            List {
                ForEach(modelo.categorias) {item in
                    Text(item.nombre)
                }
            }
        }
        .navigationTitle("Lista Categorías")
    }
}
