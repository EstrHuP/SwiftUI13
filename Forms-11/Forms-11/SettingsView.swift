//
//  SettingsView.swift
//  Forms-11
//
//  Created by Esther Huecas on 9/12/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsFactory
    
    @State private var selectedOrder = SortingOrderType.alphabetical
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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordena los cursos")) {
                    
                    /// PickerView
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos:")) {
                        ForEach(SortingOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.description)
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
            .navigationBarItems(leading:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .font(.title3)
                    .foregroundColor(.gray)
            })
            .navigationBarItems(trailing: Button("Guardar", action: {
                self.settings.order = self.selectedOrder
                self.settings.showPurchased = self.showPurchased
                self.settings.maxPrice = self.maxPrice
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
        .onAppear {
            self.selectedOrder = self.settings.order
            self.showPurchased = self.settings.showPurchased
            self.maxPrice = self.settings.maxPrice
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsFactory())
    }
}
