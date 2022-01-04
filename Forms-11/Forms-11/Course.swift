//
//  Course.swift
//  Forms-11
//
//  Created by Esther Huecas on 1/12/21.
//

import Foundation

//struct Videogame {
struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: String
    var priceLevel: Int
    var featured: Bool = false
    var purchased: Bool = false
}
