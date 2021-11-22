//
//  Task06-2View.swift
//  Transitions-07
//
//  Created by Esther Huecas on 16/11/21.
//

import SwiftUI

struct Task06_2View: View {
    
    @State private var isGoNext = false
    @State private var cardNumber = 1
    
    var body: some View {
    
        VStack {
            VStack {
                
                HeaderTask2View()
            }
            Spacer()
            
            //Left button
            HStack {
                Button {
                    self.isGoNext = false
                    withAnimation(.spring()) {
                        cardNumber = cardNumber == 1 ? 4 : cardNumber - 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                
                //Content cardview
                    switch self.cardNumber {
                    case 1:
                        CardViewCourses(image: "swift",
                                        author: "Juan Gabriel Gomila",
                                        title: "diseño de apps para ios13 con swiftui desde cero",
                                        originalPrice: "199.99$",
                                        discountPrice: "10.99$")
                    case 2:
                        CardViewCourses(image: "videogames",
                                        author: "Juan Gabriel Gomila",
                                        title: "curso completo de videojuegos con unity 2019",
                                        originalPrice: "199.99$",
                                        discountPrice: "10.99$")
                    case 3:
                        CardViewCourses(image: "maths",
                                        author: "Ricardo Alberich, Juan Gabriel Gomila y Arnaur Mir",
                                        title: "curso de probabilidad y variable aleatorias para machine learning",
                                        originalPrice: "199.99$",
                                        discountPrice: "12.99$")
                    case 4:
                        CardViewCourses(image: "python",
                                        author: "Juan Gabriel Gomila y Llorenç Valverde",
                                        title: "resuelve problemas de matemáticas con sage y python",
                                        originalPrice: "99.99$",
                                        discountPrice: "10.99$")
                    default:
                        CardViewCourses(image: "swift",
                                        author: "Juan Gabriel Gomila",
                                        title: "diseño de apps para ios13 con swiftui desde cero",
                                        originalPrice: "199.99$",
                                        discountPrice: "10.99$")
                    }
                
                //Right button
                Button {
                    self.isGoNext = true
                    withAnimation(.spring()) {
                        cardNumber = cardNumber == 1 ? 2 : cardNumber + 1
                        
                        if self.isGoNext && self.cardNumber > 4 {
                            self.cardNumber = 1
                        }
                    }
                   
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
            
            Text("cardview num: \(cardNumber)")
            Spacer()
            
        }
    }
}

struct Task06_2View_Previews: PreviewProvider {
    static var previews: some View {
        Task06_2View()
    }
}

struct HeaderTask2View: View {
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
        .padding(.horizontal)
    }
}
