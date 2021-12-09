//
//  SettingsView.swift
//  Forms-11
//
//  Created by Esther Huecas on 9/12/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordena los cursos")) {
                    Text("Mostrar formas de ordenar")
                }
                Section(header: Text("Filtrar los cursos")) {
                    Text("Filtros")
                }
            }
            .navigationTitle("Configuración")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
