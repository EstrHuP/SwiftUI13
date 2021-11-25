//
//  VideogameDetailView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct VideogameDetailView: View {
    var videogame: Videogame
    
    var body: some View {
        VStack {
            Image(videogame.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .clipped()
            Text(videogame.name)
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

struct VideogameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideogameDetailView(videogame: Videogame(name: "Dead Cells", image: "dead-cells"))
    }
}
