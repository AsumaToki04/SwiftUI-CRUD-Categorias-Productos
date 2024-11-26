//
//  EditarCategoriaView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct EditarCategoriaView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategoria
    @Binding var mostrar: Bool
    @State var nombre: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre Categoría", text: $nombre)
                Button("Guardar") {
                    if let index = modelo.categorias.firstIndex(where: {
                        $0.id == categoria.id
                    }) {
                        modelo.categorias[index].nombre = nombre
                        mostrar = false
                    }
                }
            }
        }
        .onAppear {
            nombre = categoria.nombre
        }
        .navigationTitle("Editar Categoría")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancelar") {
                    mostrar = false
                }
            }
        }
    }
}
