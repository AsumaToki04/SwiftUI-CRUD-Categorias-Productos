//
//  ListaProductosView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct ListaProductosView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategoria
    @State private var mostrarRegistro = false
    
    var body: some View {
        VStack {
            List {
                ForEach(categoria.productos) { item in
                    Text(item.nombre)
                }
            }
        }
        .navigationTitle("Lista Productos")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    mostrarRegistro = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $mostrarRegistro) {
            RegistroProductoView(categoria: categoria, modelo: modelo, mostrar: $mostrarRegistro)
        }
    }
}
