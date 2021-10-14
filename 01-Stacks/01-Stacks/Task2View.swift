//
//  Task2View.swift
//  01-Stacks
//
//  Created by Esther Huecas on 14/10/21.
//

import SwiftUI

struct Task2View: View {
    var body: some View {
        VStack {
            HeaderView()
            
            ZStack {
                
                PricingView(title: "Básico", textColor: .white, backgroundColor: .green, icon: "star")
                
                ZStack {
                    
                    PricingView(title: "Carrera", textColor: .white, backgroundColor: .gray, icon: "timer")
                    
                    DescriptionView(description: "Conviértete en el máster del universo")
                    
                }
                .offset(x: 0, y: 115)
                
                ZStack {
                    
                    PricingView(title: "Definitivo", textColor: .white, backgroundColor: .black, icon: "lightbulb")
                    
                    DescriptionView(description: "El mejor para empezar")
                }
                .offset(x: 0, y: 230)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct Task2View_Previews: PreviewProvider {
    static var previews: some View {
        Task2View()
    }
}

struct DescriptionView: View {
    
    var description: String
    
    var body: some View {
        
        Text(description)
            .font(.system(.caption, design: .rounded))
            .foregroundColor(.white)
            .fontWeight(.black)
            .padding(8)
            .background(Color(red:240/255, green: 180/255, blue:50/255))
            .offset(x: 0, y: -80)
    }
}

