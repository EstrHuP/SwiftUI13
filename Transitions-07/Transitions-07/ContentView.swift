//
//  ContentView.swift
//  Transitions-07
//
//  Created by Esther Huecas on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowTranslation = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.orange)
                .overlay(
                    Text("Car")
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .foregroundColor(.white)
                )
            if isShowTranslation {
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Coche")
                            .font(.system(.largeTitle, design: .rounded).bold())
                            .foregroundColor(.white)
                    )
                /// Transitions
                    .transition(.offsetScaledOpacityOut)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.isShowTranslation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var offsetScaledOpacityOut: AnyTransition {
        AnyTransition.offset(x: -700, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }
}
