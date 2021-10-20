//
//  ContentView.swift
//  Buttons-03
//
//  Created by Esther Huecas on 19/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            //Create
            Button(action: {
                print("Button with icon pressed")
            }) {
                HStack {
                    Image(systemName: "arrow.right")
                }
            }
            .buttonStyle(BasicButtonStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
        
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            /// UIGradients --> web for gradients
            .background(LinearGradient(gradient: Gradient(colors: [Color("Dark Ocean 1"), Color("Dark Ocean 2")]), startPoint: .leading, endPoint: .trailing))
            .font(.largeTitle)
            .foregroundColor(.white)
//            .cornerRadius(40)
            .clipShape(Circle())
            .padding()
            .rotationEffect(configuration.isPressed ? Angle(degrees: 90.0) : Angle()) //rotation effect
    }
}
