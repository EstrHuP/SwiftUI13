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
                    Image(systemName: "square.and.pencil")
                    Text("Edit")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(BasicButtonStyle())
            
            //Edit
            Button(action: {
                print("Button with icon pressed")
            }) {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(BasicButtonStyle())
            
            //Upload
            Button(action: {
                print("Button with icon pressed")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share")
                        .fontWeight(.bold)
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
            .cornerRadius(40)
//                .shadow(radius: 10.0) //Sombreado
            .shadow(color: .blue, radius: 10.0, x: 20, y: 5)
            .padding([.horizontal, .vertical])
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0) //Animations
    }
}
