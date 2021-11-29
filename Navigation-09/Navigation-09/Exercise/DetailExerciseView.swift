//
//  DetailExerciseView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct DetailExerciseView: View {
    
    var movie: SpidermanMovies
    
    var body: some View {
        VStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 480)
                .clipped()
            Text(movie.title.uppercased())
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            Text(movie.description)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}

struct DetailExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailExerciseView(movie: SpidermanMovies(title: "spider-man", image: "spiderman-1", age: "2002", description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family. Based on Marvel Comics' superhero character, this is a story of Peter Parker who is a nerdy high-schooler."))
    }
}
