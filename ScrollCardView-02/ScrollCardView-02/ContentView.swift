//
//  ContentView.swift
//  ScrollCardView-02
//
//  Created by Esther Huecas on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        VStack {
            
            HeaderView()
            
            ScrollView(showsIndicators: false) {
                
                MoreCoursesView(title: "Más cursos de Juan Gabriel Gomila")
                
                VStack {
                    
                    //First carrousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CarrouselView()
                                .frame(width: 300)
                        }
                    }
                    Spacer()
                    
                    MoreCoursesView(title: "Más cursos Random de Juan Gabriel Gomila")
                    
                    //Second carrousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CarrouselView()
                                .frame(width: 300)
                        }
                    }
                    Spacer()
                    
                    MoreCoursesView(title: "Últimos cursos")
                    
                    //Thrid carrousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CarrouselView()
                                .frame(width: 300)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
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
        .padding(.horizontal)
    }
}

struct MoreCoursesView: View {
    var title: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding([.horizontal, .top])
    }
}

struct ContentCardView: Identifiable {
    let id: Int
    let image: String
    let author: String
    let title: String
    let originalPrice: String
    let disscountPrice: String
}

struct CarrouselView: View {
    
    @State var cardViewList = [
        ContentCardView(
            id: 0,
            image: "swift",
            author: "Juan Gabriel Gomila",
            title: "diseño de apps para ios13 con swiftui desde cero",
            originalPrice: "199.99$",
            disscountPrice: "10.99$"
        ),
        ContentCardView(
            id: 1,
            image: "videogames",
            author: "Juan Gabriel Gomila",
            title: "curso completo de videojuegos con unity 2019",
            originalPrice: "199.99$",
            disscountPrice: "10.99$"
        ),
        ContentCardView(
            id: 2,
            image: "maths",
            author: "Ricardo Alberich, Juan Gabriel Gomila y Arnaur Mir",
            title: "curso de probabilidad y variable aleatorias para machine learning",
            originalPrice: "199.99$",
            disscountPrice: "12.99$"
        ),
        ContentCardView(
            id: 3,
            image: "python",
            author: "Juan Gabriel Gomila y Llorenç Valverde",
            title: "resuelve problemas de matemáticas con sage y python",
            originalPrice: "99.99$",
            disscountPrice: "10.99$"
        )]
    
    var body: some View {
        
        ForEach(cardViewList, id: \.id) { data in
            CardView(
//                image: cardViewList.randomElement()!.image, ///Image Random
                image: data.image,
                author: data.author,
                title: data.title,
                originalPrice: data.originalPrice,
                discountPrice: data.disscountPrice)
        }
    }
}
