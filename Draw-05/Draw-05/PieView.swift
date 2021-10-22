//
//  PieView.swift
//  Draw-05
//
//  Created by Esther Huecas on 22/10/21.
//

import SwiftUI

struct PieView: View {
    var body: some View {
        
        ZStack {
            
            //Arriba derecha
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 100,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 200),
                            clockwise: true)
                
            }.fill(.blue)
            
            //Izquierdo relleno
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 100,
                            startAngle: Angle(degrees: 200),
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
                
            }.fill(.yellow)
                .offset(x: -30, y: 0)
            
            // Borde izquierdo
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 100,
                            startAngle: Angle(degrees: 200),
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
                path.closeSubpath()
                
            }.stroke(.black)
                .offset(x: -30, y: 0)
                .overlay(Text("11.1%")
                            .font(.system(.largeTitle).bold())
                            .offset(x: -90, y: -160))
            
            // Abajo
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 100,
                            startAngle: Angle(degrees: 160),
                            endAngle: Angle(degrees: 80),
                            clockwise: true)
                
            }.fill(.pink)
            
            // Abajo derecha
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 100,
                            startAngle: Angle(degrees: 80),
                            endAngle: Angle(degrees: 0),
                            clockwise: true)
                
            }.fill(.green)
        }
    }
}

struct PieView_Previews: PreviewProvider {
    static var previews: some View {
        PieView()
    }
}
