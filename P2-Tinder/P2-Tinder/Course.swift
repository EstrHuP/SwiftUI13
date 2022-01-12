//
//  Course.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import Foundation


struct Course {
    var name: String
    var image: String
}

#if DEBUG
var coursesArray: [Course] = [
    Course(name: "Android con kotlin", image: "android-kotlin"),
    Course(name: "Machine Learning de la A a la Z", image: "machine-learning"),
    Course(name: "Aprende Python facilmente", image: "python"),
    Course(name: "Curso de Unity 2019", image: "unity-2021"),
    Course(name: "Aprende base de datos con MySQL", image: "mysql"),
    Course(name: "Pon en practica tus conocimientos en C#", image: "c#"),
]

#endif
