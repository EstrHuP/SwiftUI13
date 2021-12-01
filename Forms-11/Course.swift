//
//  Videogames.swift
//  Forms-11
//
//  Created by Esther Huecas on 1/12/21.
//

import Foundation

struct Videogame: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var feature: Bool = false
}
