//
//  RegistroCategoriaView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

struct RegistroCategoriaView: View {
    @ObservedObject var modelo: ModeloCategoria
    @Binding var mostrar: Bool
    @State var nombre: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre de categoría", text: $nombre)
                Button("Guardar") {
                    let categoria = Categoria(nombre: nombre, productos: [])
                    modelo.categorias.append(categoria)
                    mostrar = false
                }
            }
            .navigationTitle("Registro Categoría")
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
