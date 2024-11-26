//
//  ListaCategoriasView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct ListaCategoriasView: View {
    @ObservedObject var modelo: ModeloCategoria
    @State private var mostrarRegistro = false
    
    var body: some View {
        VStack {
            List {
                ForEach(modelo.categorias) {item in
                    NavigationLink(
                        destination: ListaProductosView(categoria: item, modelo: modelo)
                    ) {
                        Text(item.nombre)
                    } 
                }
                .onDelete { indices in
                    modelo.categorias.remove(atOffsets: indices)
                }
            }
        }
        .navigationTitle("Lista Categorías")
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
            RegistroCategoriaView(modelo: modelo, mostrar: $mostrarRegistro)
        }
    }
}
