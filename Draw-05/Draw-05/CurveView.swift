//
//  CurveView.swift
//  Draw-05
//
//  Created by Esther Huecas on 22/10/21.
//

import SwiftUI

struct CurveView: View {
    var body: some View {
        ZStack {
//            Path() { path in
//                path.move(to: CGPoint(x: 60, y: 130))
//                path.addLine(to: CGPoint(x: 130, y: 60))
//                path.addLine(to: CGPoint(x: 200, y: 130))
//            }
            
            Text("Prueba")
                .font(.system(.title, design: .rounded))
                .frame(width: 200, height: 100)
                .background(FunnyLabel(perCircle: 0.9).fill(.blue))
            
            Path() { path in
                path.move(to: CGPoint(x: 30, y: 130))
                path.addLine(to: CGPoint(x: 60, y: 130))
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 50))
                path.addLine(to: CGPoint(x: 230, y: 130))
                path.addLine(to: CGPoint(x: 230, y: 250))
                path.addLine(to: CGPoint(x: 30, y: 250))
                path.closeSubpath()
            }
            .stroke(.yellow, lineWidth: 5)
            
            Circle()
                .foregroundColor(.pink)
                .frame(width:100, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                )
        }
    }
}

struct CurveView_Previews: PreviewProvider {
    static var previews: some View {
        CurveView()
    }
}

struct FunnyLabel: Shape  {
    
    var perCircle = 1.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.size.width * (1-perCircle)/2, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width * (1-(1-perCircle)/2), y: 0), control: CGPoint(x: rect.size.width / 2, y: -(rect.size.width * 0.4)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}
