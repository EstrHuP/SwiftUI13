//
//  Course.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Huecas on 10/1/22.
//

import Foundation

struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool = false
    
    init(name: String, description: String, image: String, type: String, priceLevel: Int) {
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.priceLevel = priceLevel
    }
    
    init() {
        self.init(name: "", description: "", image: "", type: "", priceLevel: 0)
    }
}

#if DEBUG
var courses: [Course] = [
    Course(
        name: "Aprende a programar en Android con Kotlin",
        description: """
        Este curso es ideal para todos aquellos estudiantes que busquen combinar el poder de iOS 13.3 y Swift 5.2 para exprimir al máximo, sobretodo desentrañando el poder de SwiftUI. Las clases se explican con toda la teoría necesaria para entender los conceptos de desarrollo y por eso no se necesita experiencia previa en el sector. Al completar el curso tendrás todo el conocimiento necesario para diseñar e implementar apps reales y subirlas directamente a la App Store, así como disponer de un portfolio de proyectos la mar de interesante para que te contraten como desarrollador junior en el futuro.

        Es un curso totalmente actualizado, con la última versión de Swift 5.2 y la sintaxis más moderna de Swift UI, así que puedes estar seguro de que lo que aprendes está totalmente al día y modernizado. Además, los contenidos del curso cubren aspectos muy demandados en la programación de aplicaciones móviles como el MVVM (Model-View-ViewModel) o el nuevo framework Combine de Apple que trabaja a la perfección junto con SwiftUI para ofrecer unos resultados de 10!

        Además, todos los proyectos del curso, recursos adicionales, ejercicios y código fuente lo tendrás disponible y compartido contigo a través de GitHub, además de disponer de acceso único por ser estudiante del curso a la comunidad de Discord, donde podrás unirte a miles de estudiantes que como tu buscan aprender a crear sus propias apps para iOS. ¡Por si fuera poco, Juan Gabriel Gomila y todo su equipo, responderá tus dudas en menos de 24 horas! ¿Qué más se puede pedir?

        ¡Feliz aprendizaje con nosotros, y te vemos en clase!
        """,
        image: "android-kotlin",
        type: "Mobile",
        priceLevel: 3),
    Course(
        name: "Machine Learning de A a la Z: R y Python para Data Science",
        description: "",
        image: "machine-learning",
        type: "Data",
        priceLevel: 4),
    Course(
        name: "Curso completo de Python de la A a la Z - 2021 +50 horas",
        description: "",
        image: "python",
        type: "Data",
        priceLevel: 2),
    Course(
        name: "Curso de desarrollo de videojuegos con Unity 2021",
        description: "",
        image: "unity-2021",
        type: "Videogames",
        priceLevel: 2),
    Course(
        name: "Desarrollo de juegos con Unreal Engine de 0 a profesional",
        description: "",
        image: "unreal",
        type: "Videogames",
        priceLevel: 4),
    Course(
        name: "Ciencia de datos con MySQL, RStudio y Power BI: Casos Reales",
        description: "",
        image: "mysql",
        type: "DataBase",
        priceLevel: 1),
    Course(
        name: "Aprende C# creando un juego en Unity 5: de cero a experto",
        description: "",
        image: "c#",
        type: "Videogames",
        priceLevel: 2)
]
#endif
