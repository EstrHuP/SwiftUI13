//
//  SettingsView.swift
//  Forms-11
//
//  Created by Esther Huecas on 9/12/21.
//

import SwiftUI

struct SettingsView: View {
    
    private var sortingsOrder = [
        "Alfabéticamente",
        "Favoritos al inicio",
        "Comprados al inicio"
    ]
    
    @State private var selectedOrder = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordena los cursos")) {
                    
                    /// PickerView
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos:")) {
                        ForEach(0..<sortingsOrder.count, id: \.self) {
                            Text(self.sortingsOrder[$0])
                        }
                    }
                    
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
