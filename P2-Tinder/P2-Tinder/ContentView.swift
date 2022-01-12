//
//  ContentView.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    
    var deckCards: [CardView] = {
        var cards = [CardView]()
        
        for idx in 0..<2 {
            cards.append(CardView(course: coursesArray[idx]))
        }
        return cards
    }()
    
    var body: some View {
        VStack {
            TopBarView()
            Spacer(minLength: 10)
            ZStack {
                ForEach(deckCards) { card in
                    card.zIndex(self.isTopView(card: card) ? 1 : 0)
                }
            }
            BottomBarView()
        }
    }
    
    private func isTopView(card: CardView) -> Bool {
        guard let idx = deckCards.firstIndex(where: {$0.id == card.id}) else {
            return false
        }
        //si llegamos hasta aquí, está en el mazo
        return idx == 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .padding(15)
    }
}

struct BottomBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Comprar el curso")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(15)
            
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .padding(15)
    }
}
