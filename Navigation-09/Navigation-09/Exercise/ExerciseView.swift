//
//  ExerciseView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct ExerciseView: View {
    
    @State var listSpiderman = [
        SpidermanMovies(title: "Spider-man", image: "spiderman-1", age: "2002", description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family. Based on Marvel Comics' superhero character, this is a story of Peter Parker who is a nerdy high-schooler."),
        SpidermanMovies(title: "Spider-man 2", image: "spiderman-2", age: "2004", description: "Set two years after the original, the film focuses on Peter Parker struggling to manage both his personal life and his duties as Spider-Man. The main villain in this film is Dr. Otto Octavius, who turns insane following a failed experiment and the death of his wife."),
        SpidermanMovies(title: "Spider-man 3", image: "spiderman-3", age: "2007", description: "A strange black entity from another world bonds with Peter Parker and causes inner turmoil as he contends with new villains, temptations, and revenge."),
        SpidermanMovies(title: "Amazing Spider-man", image: "amazing-spiderman", age: "2012", description: "The Amazing Spider-Man follows the origin story of Peter Parker's beginnings as the world-renowned wall-crawler. After being bitten by a radio-active spider, Peter acquires amazing abilities which will help him achieve things one could only dream about."),
        SpidermanMovies(title: "Spider-man Homecoming", image: "spiderman-homecoming", age: "2017", description: "Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man, and finds himself on the trail of a new menace prowling the skies of New York City. A young Peter Parker/Spider-Man begins to navigate his newfound identity as the web-slinging super hero Spider-Man."),
        SpidermanMovies(title: "Spider-man Far From Home", image: "spiderman-far-from-home",age: "2019", description: "Spider-Man must step up to take on new threats in a world that has changed forever. Our friendly neighborhood Super Hero decides to join his best friends Ned, MJ, and the rest of the gang on a European vacation."),
        SpidermanMovies(title: "Spider-man No Way Home", image: "spiderman-no-way-home", age: "2021", description: "Spider-Man: No Way Home is an upcoming American superhero film based on the Marvel Comics character Spider-Man co-produced by Columbia Pictures and Marvel Studios and distributed by Sony Pictures Releasing. ... A third MCU Spider-Man film was planned as early as 2017, during production on Homecoming.")
    ]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!,
            .foregroundColor: UIColor.black
        ]
        appearance.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor: UIColor.darkGray
        ]
        appearance.setBackIndicatorImage(UIImage(systemName: "arrow.uturn.left"), transitionMaskImage: UIImage(systemName: "arrow.left.circle"))
        
        UINavigationBar.appearance().tintColor = .darkGray
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().backgroundColor = .orange
    }
    
    var body: some View {
        NavigationView {
            List(listSpiderman.indices) { movie in
                NavigationLink(destination: DetailExerciseView(movie: self.listSpiderman[movie])) {
                        CardView(movie: self.listSpiderman[movie])
                }
            }
            .navigationBarTitle("Spider-man Movies".uppercased())
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

struct SpidermanMovies: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var age: String
    var description: String
}

struct ContentList: View {
    
    var movies: SpidermanMovies
    
    var body: some View {
        HStack {
            Image(movies.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 200)
            Text(movies.title)
        }
    }
}

