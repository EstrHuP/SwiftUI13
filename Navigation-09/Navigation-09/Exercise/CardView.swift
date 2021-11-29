//
//  CardView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct CardView: View {
    
//    var image: String
//    var age: String
//    var title: String
//    var description: String
    
    var movie: SpidermanMovies
    
    var body: some View {
        
        VStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(movie.age)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(movie.title.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(5)
                }
                .layoutPriority(10) //prioriza antes el cardview al spacer
                Spacer()
            }
            .padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 3)) //borde
        .padding([.horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(movie: SpidermanMovies(title: "Spider-man", image: "spiderman-1", age: "2002", description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family. Based on Marvel Comics' superhero character, this is a story of Peter Parker who is a nerdy high-schooler."))
    }
}

