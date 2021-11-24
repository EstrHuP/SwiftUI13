//
//  ExerciseView.swift
//  Lists-08
//
//  Created by Esther Huecas on 24/11/21.
//

import SwiftUI

struct ExerciseView: View {
    
    var listSeries = [
        Series(genre: "animation", title: "Gravity Falls", image: "gravity-falls"),
        Series(genre: "animation", title: "Adventure Time", image: "adventure-time"),
        Series(genre: "animation", title: "Futurama", image: "futurama"),
        Series(genre: "comedy", title: "How I met your mother", image: "how-i-met-your-mother"),
        Series(genre: "comedy", title: "Friends", image: "friends"),
        Series(genre: "comedy", title: "Modern Family", image: "modern-family"),
        Series(genre: "drama", title: "Breaking Bad", image: "breaking-bad"),
        Series(genre: "drama", title: "Mr. Robot", image: "mr-robot")
    ]
    
    var body: some View {
        List(listSeries) { serie in
            SerieGenre(serie: serie)
        }
    }
}

struct SerieGenre: View {
    var serie: Series
    
    var body: some View {
        HStack {
            switch serie.genre {
            case "animation":
                SerieCircleGenre(serie: serie, color: Color.red)
            case "comedy":
                SerieCircleGenre(serie: serie, color: Color.orange)
            case "drama":
                SerieCircleGenre(serie: serie, color: Color.gray)
            default:
                SerieCircleGenre(serie: serie, color: Color.pink)
            }
        }
    }
}

struct SerieCircleGenre: View {
    var serie: Series
    var color: Color
    
    var body: some View {
        Image(serie.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 100)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(color, lineWidth: 5))
        
        Text(serie.title)
            .font(.system(.title, design: .rounded).bold())
            .multilineTextAlignment(.center)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

struct Series: Identifiable {
    var id = UUID()
    var genre: String
    var title: String
    var image: String
}
