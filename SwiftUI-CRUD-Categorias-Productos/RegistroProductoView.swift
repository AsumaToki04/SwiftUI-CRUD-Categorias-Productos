//
//  RegistroProductoView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct RegistroProductoView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategoria
    @Binding var mostrar: Bool
    @State private var nombre: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre de Producto", text: $nombre)
                Button("Guardar") {
                    if let index = modelo.categorias.firstIndex(where: {
                        $0.id == categoria.id
                    }) {
                        let producto = Producto(nombre: nombre)
                        modelo.categorias[index].productos.append(producto)
                        mostrar = false
                    }
                }
            }
            .navigationTitle("Registro Producto")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
    }
}
