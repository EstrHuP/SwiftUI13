//
//  ContentView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isHasBeenPressed = false
    @GestureState private var isHasBeenLongPressed = false
    
    var body: some View {
        Image(systemName: "heart")
            .font(.system(size: 100))
            .foregroundColor(.purple)
            .opacity(isHasBeenLongPressed ? 0.5 : 1.0)
            .scaleEffect(isHasBeenPressed ? 2.0 : 1.0)
            .animation(.easeIn)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($isHasBeenLongPressed) { (value, state, transaction) in
                        state = value
                    }
                    .onEnded { _ in
                        self.isHasBeenPressed.toggle()
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
