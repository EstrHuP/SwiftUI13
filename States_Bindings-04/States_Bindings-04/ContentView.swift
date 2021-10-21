//
//  ContentView.swift
//  States_Bindings-04
//
//  Created by Esther Huecas on 21/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    
    var body: some View {
        
        Button {
            self.isPressed.toggle() //change status of bool
        } label: {
            Image(systemName: isPressed ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(isPressed ? .red : .blue)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
