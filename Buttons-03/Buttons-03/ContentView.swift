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
            Button(action: {
                print("Button pressed")
            }) {
                Text("I'm a button")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                
                    .padding(12)
                    .overlay (
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.black, lineWidth: 5)
                    )
            }
            
            Button(action: {
                print("Button with icon pressed")
            }) {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                        .fontWeight(.bold)
                }
                .padding()
                /// UIGradients --> web for gradients
                .background(LinearGradient(gradient: Gradient(colors: [Color("Dark Ocean 1"), Color("Dark Ocean 2")]), startPoint: .leading, endPoint: .trailing))
//                .clipShape(Circle())
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
//                .shadow(radius: 10.0) //Sombreado
                .shadow(color: .blue, radius: 10.0, x: 20, y: 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
