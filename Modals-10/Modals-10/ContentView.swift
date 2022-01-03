//
//  ContentView.swift
//  Modals-10
//
//  Created by Esther Huecas on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedGame: Videogame?
    
    var listVideogames = [
        Videogame(name: "The Binding of Isaac", image: "the-binding-of-isaac", feature: true),
        Videogame(name: "Shovel Knight", image: "shovel-knight"),
        Videogame(name: "Dead Cells", image: "dead-cells"),
        Videogame(name: "Graveyard Keeper", image: "graveyard-keeper", feature: true),
        Videogame(name: "Hollow Knight", image: "hollow-knight", feature: true),
        Videogame(name: "Blasphemous", image: "blasphemous"),
        Videogame(name: "Stardew Valley", image: "stardew-valley", feature: true)
    ]
    
    var body: some View {
        NavigationView {
            List(listVideogames) { game in
                VideogameFullImageRow(videogame: game)
                    .onTapGesture {
                        self.selectedGame = game
                    }
            }
            
            .sheet(item: self.$selectedGame) { game in
                VideogameDetailView(videogame: game)
            }
            .navigationBarTitle("Indie's Videogames", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Videogame {
struct Videogame: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var feature: Bool = false
}

struct VideogameImageRoundRow: View {
    var videogame: Videogame
    var body: some View {
        HStack {
            Image(videogame.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
            Text(videogame.name)
                .frame(width: 100)
        }
    }
}

struct VideogameFullImageRow: View {
    var videogame: Videogame
    var body: some View {
        ZStack {
            Image(videogame.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.50)
                )
            Text(videogame.name)
                .font(.system(.title, design: .rounded).bold())
                .foregroundColor(.white)
        }
    }
}
