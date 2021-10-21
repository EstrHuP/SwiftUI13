//
//  Exercise_1.swift
//  States_Bindings-04
//
//  Created by Esther Huecas on 21/10/21.
//

import SwiftUI

struct Exercise_1: View {
    
    @State private var count = 0
    @State private var result = 0
    
    var body: some View {
        
        VStack {
            Text("Botón contador")
            
            //Count's Button
            Button {
                count += 1
            } label: {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.blue)
                    .overlay(Text("\(count)"))
                    .font(.system(size: 50, weight: .black, design: .rounded))
                    .foregroundColor(.white)
            }
            
            //Minus or plus result with two buttons
            Text("Botón añadir y quitar")
                .padding(.top, 100)
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.purple)
                .overlay(Text("\(result)"))
                .font(.system(size: 50, weight: .black, design: .rounded))
                .foregroundColor(.white)
            
            HStack {
                Button {
                    self.result -= 1
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                }
                
                Button {
                    self.result += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.green)
                }
            }
        } .padding()
    }
}

struct Exercise_1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_1()
    }
}
