//
//  ContentView.swift
//  ScrollCardView-02
//
//  Created by Esther Huecas on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        ScrollView {
            HeaderView()
            ContentScrollView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        
        VStack {
            Image("udemy-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            
            Text("Juan Gabriel Gomila")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("UCI, Profesor Universitario y CEO de Frogames")
                .fontWeight(.light)
                .foregroundColor(.secondary)
            Text("138.293 estudiantes - 59 cursos - 23.432 reseñas")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.secondary)
            
        }
    }
}

struct ContentScrollView: View {
    var body: some View {
        
        CardView(image: "swift", author: "Juan Gabriel Gomila", title: "diseño de apps para ios13 con swiftui desde cero", originalPrice: "199.99$", discountPrice: "10.99$")
        
        CardView(image: "videogames", author: "Juan Gabriel Gomila", title: "curso completo de videojuegos con unity 2019", originalPrice: "199.99$", discountPrice: "11.99$")
        
        CardView(image: "maths", author: "Ricardo Alberich, Juan Gabriel Gomila y Arnaur Mir", title: "curso de probabilidad y variable aleatorias para machine learning", originalPrice: "199.99$", discountPrice: "12.99$")
        
        CardView(image: "python", author: "Juan Gabriel Gomila y Llorenç Valverde", title: "resuelve problemas de matemáticas con sage y python", originalPrice: "99.99$", discountPrice: "10.99$")
        
    }
}
