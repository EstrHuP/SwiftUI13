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
    @State private var showPurchased = false
    @State private var maxPrice = 5 {
        didSet {
            if maxPrice > 5 {
                self.maxPrice = 5
            }
            if maxPrice < 1 {
                self.maxPrice = 1
            }
        }
    }
    
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
                    
                    /// Toggle (Switch)
                    Toggle(isOn: $showPurchased) {
                        Text("Mostrar cursos comprados")
                    }
                    
                    Stepper(onIncrement: {
                        self.maxPrice += 1
                    }, onDecrement: {
                        self.maxPrice -= 1
                    }) {
                        Text("Mostrar \(String(repeating: "€", count: maxPrice)) o menos")
                    }
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
