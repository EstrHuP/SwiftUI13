//
//  ContentView.swift
//  01-Stacks
//
//  Created by Esther Huecas on 14/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            HeaderView()
            
            HStack(spacing: 8) {
                
                PricingView(title: "Básico", price: "9.99€", subtitle: "Un curso incluido", textColor: .white, backgroundColor: .green)
                
                ZStack {
                    PricingView(title: "Carrera", price: "29.99€", subtitle: "Toda una carrera", textColor: .black, backgroundColor: Color(red: 230/255, green: 230/255, blue:230/255))
                    
                    DetailView(title: "El mejor para empezar", isSecondSection: true)
                }
            } .padding()
            
            ZStack {
                PricingView(title: "Definitivo", price: "99.99€", subtitle: "Todos los cursos onlinne", textColor: .white, backgroundColor: Color(red: 100/255, green: 100/255, blue: 100/255), icon: "lightbulb").padding(.horizontal)
                
                DetailView(title: "Conviértete en el master del universo", isSecondSection: false)
            }
            .padding(.vertical)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Elige tu itinerario")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("de aprendizaje")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var price: String?
    var subtitle: String?
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            
            icon.map({
                Image(systemName:$0)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
            
            Text(title)
                .font(.system(.title, design:.rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(price ?? "")
                .font(.system(size: 30, weight:.heavy, design:.rounded))
                .foregroundColor(textColor)
            
            Text(subtitle ?? "")
                .font(.headline)
                .foregroundColor(textColor)
            
        }
        .frame(minWidth:0, maxWidth: .infinity, minHeight: 100)
            .padding(30)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct DetailView: View {
    
    var title: String
    var isSecondSection: Bool
    
    var body: some View {
        
        Text(title)
            .font(.system(.caption, design: .rounded))
            .foregroundColor(.white)
            .fontWeight(.black)
        .padding(8)
            .background(Color(red:240/255, green: 180/255, blue:50/255))
            .offset(x: 0, y: -95)
    }
}

