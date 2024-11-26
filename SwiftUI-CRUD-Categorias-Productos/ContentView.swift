//
//  ContentView.swift
//  SwiftUI-CRUD-Categorias-Productos
//
//  Created by Asuma Toki on 11/26/24.
//

import SwiftUI

class ModeloCategoria: ObservableObject {
    @Published var categorias: [Categoria] = [] {
        didSet {
            guardarDatos()
        }
    }
    
    init() {
        cargarDatos()
    }
    
    private func archivoURL() -> URL {
        let documento = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
        return documento.appendingPathExtension("categorias.json")
    }
    
    private func guardarDatos() {
        do {
            let datos = try JSONEncoder().encode(categorias)
            try datos.write(to: archivoURL())
        } catch {
            print("Error al guardar datos: \(error)")
        }
    }
    
    private func cargarDatos() {
        do {
            let data = try Data(contentsOf: archivoURL())
            categorias = try JSONDecoder().decode([Categoria].self, from: data)
        } catch {
            print("Error al cargar datos: \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject var modeloGlobal = ModeloCategoria()
    
    var body: some View {
        NavigationView {
            ListaCategoriasView(modelo: modeloGlobal)
        }
    }
}
