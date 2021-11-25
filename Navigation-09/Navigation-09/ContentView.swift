//
//  ContentView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var listVideogames = [
        Videogame(name: "The Binding of Isaac", image: "the-binding-of-isaac", feature: true),
        Videogame(name: "Shovel Knight", image: "shovel-knight"),
        Videogame(name: "Dead Cells", image: "dead-cells"),
        Videogame(name: "Graveyard Keeper", image: "graveyard-keeper", feature: true),
        Videogame(name: "Hollow Knight", image: "hollow-knight", feature: true),
        Videogame(name: "Blasphemous", image: "blasphemous"),
        Videogame(name: "Stardew Valley", image: "stardew-valley", feature: true)
    ]
    
    //Custom navigation bar with SwiftUI. Although it depends on UIKit
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!,
            .foregroundColor: UIColor.systemGreen
        ]
        appearance.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor: UIColor.systemRed
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            List(listVideogames.indices) { index in
                
                NavigationLink(destination: VideogameDetailView(videogame: self.listVideogames[index])) {
                    
                    if self.listVideogames[index].feature {
                        VideogameFullImageRow(videogame: self.listVideogames[index])
                    } else {
                        VideogameImageRoundRow(videogame: self.listVideogames[index])
                    }
                }
            }
//            .navigationBarTitle("Inidie's Videogames", displayMode: .inline)
            .navigationBarTitle("Inidie's Videogames")
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

