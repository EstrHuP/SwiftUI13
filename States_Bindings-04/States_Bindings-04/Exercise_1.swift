//
//  Exercise_1.swift
//  States_Bindings-04
//
//  Created by Esther Huecas on 21/10/21.
//

import SwiftUI

struct Exercise_1: View {
    
    @State private var numClicks = 0
    @State private var total = 0
    
    var body: some View {
        
        VStack {
            Text("Botón contador")
            
            CounterView(numClicks: $numClicks, buttonColor: .blue)
            
            //Minus or plus result with two buttons
            Text("Botón añadir y quitar")
            
                .padding(.top, 100)
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.purple)
                .overlay(Text("\(total)"))
                .font(.system(size: 50, weight: .black, design: .rounded))
                .foregroundColor(.white)
            
            HStack {
                MinusView(total: $total)
                PlusView(total: $total)
            }
        } .padding()
    }
}

struct Exercise_1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_1()
    }
}

struct CounterView: View {
    
    @Binding var numClicks: Int
    var buttonColor: Color
    
    var body: some View {
        
        //Count's Button
        Button {
            numClicks += 1
        } label: {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(buttonColor)
                .overlay(Text("\(numClicks)"))
                .font(.system(size: 50, weight: .black, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct MinusView: View {
    
    @Binding var total: Int
    
    var body: some View {
        Button {
            self.total -= 1
        } label: {
            Image(systemName: "minus.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
        }
    }
}

struct PlusView: View {
    
    @Binding var total: Int
    
    var body: some View {
        Button {
            self.total += 1
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
        }
    }
}
