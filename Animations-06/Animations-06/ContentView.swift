//
//  ContentView.swift
//  Animations-06
//
//  Created by Esther Huecas on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    //Animaciones Implicitas
    
    @State private var isButtonColorChanged = false
    @State private var isIconChanged = false
    @State private var isIconSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(isButtonColorChanged ? .white : .green)
            
            Image(systemName: "keyboard")
                .font(.system(size: 80))
                .foregroundColor(isIconChanged ? .green : .white)
                .scaleEffect(isIconChanged ? 1.0 : 0.5)
        }
//        .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.5))
//        .animation(.default)
        .onTapGesture {
            withAnimation(.default) {
                self.isButtonColorChanged.toggle()
                self.isIconChanged.toggle()
            }
            self.isIconSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
