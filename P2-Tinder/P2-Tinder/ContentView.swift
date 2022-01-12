//
//  ContentView.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    
    private let threshold: CGFloat = 100
    
    @GestureState private var dragState = DragState.none
    
    @State private var lastCardIdx = 1
    
    @State var deckCards: [CardView] = {
        var cards = [CardView]()
        
        for idx in 0..<2 {
            cards.append(CardView(course: coursesArray[idx]))
        }
        return cards
    }()
    
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    
    var body: some View {
        VStack {
            TopBarView()
            Spacer(minLength: 10)
            ZStack {
                ForEach(deckCards) { card in
                    card
                        .zIndex(self.isTopCard(card: card) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 80))
                                    .foregroundColor(Color.red)
                                    .opacity(self.dragState.translation.width < -self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                
                                Image(systemName: "heart.circle.fill")
                                    .font(.system(size: 80))
                                    .foregroundColor(Color.green)
                                    .opacity(self.dragState.translation.width > self.threshold && self.isTopCard(card: card) ? 1 : 0)
                            }
                        )
                        .offset(x: self.isTopCard(card: card) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(card: card) ? self.dragState.translation.height : 0)
                        //hacer más pequeño cuando descartamos
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                        //rotar cuando descartamos
                        .rotationEffect(Angle(degrees: Double(self.isTopCard(card: card) ? self.dragState.translation.width/10 : 0)))
                        .animation(.interpolatingSpring(stiffness: 18, damping: 100))
                        //animacion de dejar caer la primera carta una vez seleccionada
                        .transition(self.removalTransition)
                        //añadir el gesto para que funcione la animacion
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                        .onChanged { (value) in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            //si es > hemos arrastrado hacia el lado derecho
                            self.removalTransition = drag.translation.width > 0 ? .trailingBottomAtRemoval : .leadingBottomAtRemoval
                        }
                        .onEnded { (value) in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width > self.threshold || drag.translation.width < -self.threshold {
                                //TODO: - Marcar el curso como X o corazon
                                self.updateDeckCards()
                            }
                        }
                    )
                }
            }
            BottomBarView()
                .opacity(self.dragState.isDragging ? 0.1 : 1.0)
                .animation(.linear)
        }
    }
    
    private func isTopCard(card: CardView) -> Bool {
        guard let idx = deckCards.firstIndex(where: {$0.id == card.id}) else {
            return false
        }
        //si llegamos hasta aquí, está en el mazo
        return idx == 0
    }
    
    private func updateDeckCards() {
        deckCards.removeFirst() //eliminar la primera carta
        self.lastCardIdx += 1 //incrementar la unidad de la siguiente carta
        
        let newCourse = coursesArray[self.lastCardIdx % coursesArray.count] //extraer nueva carta
        let newCardView = CardView(course: newCourse) //volver a cargar la baraja de cartas
        
        deckCards.append(newCardView) //añadir la nueva baraja de cartas y swiftui lo actualizara gracias al State
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
                //TODO: - logica de comprar el curso. Debera guardarse en un listado
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
