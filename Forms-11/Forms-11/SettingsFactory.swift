//
//  SettingsFactory.swift
//  Forms-11
//
//  Created by Esther Huecas on 3/1/22.
//

import Foundation

final class SettingsFactory {
    
    var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.settings.order": 0,
            "app.view.settings.showPurchased": false,
            "app.view.settings.maxPrice": 5
        ])
    }
    
    var order: SortingOrderType {
        get {
            SortingOrderType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        set {
            defaults.set(newValue.rawValue, forKey: "app.view.settings.order")
        }
    }
    var showPurchased: Bool {
        get {
            defaults.bool(forKey: "app.view.settings.showPurchased")
        }
        set {
            defaults.set(newValue, forKey: "app.view.settings.showPurchased")
        }
    }
    var maxPrice: Int {
        get {
            defaults.integer(forKey: "app.view.settings.maxPrice")
        }
        set {
            defaults.set(newValue, forKey: "app.view.settings.maxPrice")
        }
    }
}
