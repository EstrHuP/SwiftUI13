//
//  Task06-1View.swift
//  Transitions-07
//
//  Created by Esther Huecas on 16/11/21.
//

import SwiftUI

struct Task06_1View: View {
    
    @State private var isBasicSelected = false
    @State private var isDegreeSelected = false
    @State private var isDefinitySelected = false
    
    @State private var isDegreeDetailShowed = false
    @State private var isDefinityDetailShowed = false
    
    @State private var tinyZIndex = 1
    @State private var largeZIndex = -1
    
    var body: some View {
        VStack {
            
            HeaderView()
            
            HStack(spacing: 8) {
                
                CardView(title: "Básico", price: "9.99€", subtitle: "Un curso incluido", textColor: .white, backgroundColor: .green)
                
                    .scaleEffect(self.isBasicSelected ? 1.5 : 1.0)
                    .offset(x: self.isBasicSelected ? 100 : 0, y: self.isBasicSelected ? 120 : 0)
                    .zIndex(Double(self.tinyZIndex))
                
                    .onTapGesture {
                        if !self.isDegreeSelected && !self.isDefinitySelected {
                            withAnimation(.easeInOut) {
                                self.isBasicSelected.toggle()
                            }
                        }
                        if !self.isBasicSelected {
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                self.largeZIndex = 1
                            }
                        } else {
                            self.largeZIndex = 100
                        }
                    }
                
                ZStack {
                    CardView(title: "Carrera", price: "29.99€", subtitle: "Toda una carrera", textColor: .black, backgroundColor: Color(red: 230/255, green: 230/255, blue:230/255))
                    
                    if self.isDegreeDetailShowed {
                        DetailView(title: "El mejor para empezar", isSecondSection: true)
                    }
                }
                
                .scaleEffect(self.isDegreeSelected ? 1.5 : 1.0)
                .offset(x: self.isDegreeSelected ? -90 : 0, y: self.isDegreeSelected ? 120 : 0)
                .zIndex(Double(self.tinyZIndex))
                
                .onTapGesture {
                    if !self.isBasicSelected && !self.isDefinitySelected {
                        withAnimation(.easeInOut) {
                            self.isDegreeSelected.toggle()
                            self.isDegreeDetailShowed.toggle()
                        }
                    }
                    if !self.isDegreeSelected {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                            self.largeZIndex = 1
                        }
                    } else {
                        self.largeZIndex = 100
                    }
                }
            } .padding()
            
            ZStack {
                CardView(title: "Definitivo", price: "99.99€", subtitle: "Todos los cursos onlinne", textColor: .white, backgroundColor: Color(red: 100/255, green: 100/255, blue: 100/255), icon: "lightbulb").padding(.horizontal)
                
                if self.isDefinityDetailShowed {
                    DetailView(title: "Conviértete en el master del universo", isSecondSection: false)
                }
            }
            .scaleEffect(self.isDefinitySelected ? 1.05 : 1.0)
            .offset(x: 0, y: self.isDefinitySelected ? -120 : 0)
            .zIndex(Double(self.largeZIndex))
            
            .onTapGesture {
                if !self.isBasicSelected && !self.isDegreeSelected {
                    withAnimation(.easeInOut) {
                        self.isDefinitySelected.toggle()
                        self.isDefinityDetailShowed.toggle()
                    }
                }
                if !self.isDefinitySelected {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                        self.largeZIndex = 1
                    }
                } else {
                    self.largeZIndex = 100
                }
            }
            .padding(.vertical)
            Spacer()
        }
    }
}

struct Task06_1View_Previews: PreviewProvider {
    static var previews: some View {
        Task06_1View()
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

