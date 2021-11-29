//
//  VideogamesDetailView.swift
//  Modals-10
//
//  Created by Esther Huecas on 29/11/21.
//

import SwiftUI

struct VideogameDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var videogame: Videogame
    
    var body: some View {
        VStack {
            Image(videogame.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(videogame.name)
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
        )
    }
}

struct VideogameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideogameDetailView(videogame: Videogame(name: "Dead Cells", image: "dead-cells"))
    }
}
