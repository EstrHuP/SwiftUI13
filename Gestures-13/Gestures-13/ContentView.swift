//
//  ContentView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var position = CGSize.zero
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        Image(systemName: "heart")
            .font(.system(size: 100))
            .foregroundColor(.purple)
            .offset(x: position.width + offset.width,
                    y: position.height + offset.height)
            .animation(.easeIn)
            .gesture(
                DragGesture()
                    .updating($offset) { (value, state, transaction) in
                        state = value.translation
                    }
                    .onEnded { (value) in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
