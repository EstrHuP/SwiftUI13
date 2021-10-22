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
            Path() { path in
                path.move(to: CGPoint(x: 60, y: 130))
                path.addLine(to: CGPoint(x: 130, y: 60))
                path.addLine(to: CGPoint(x: 200, y: 130))
            }
            Path() { path in
                path.move(to: CGPoint(x: 30, y: 130))
                path.addLine(to: CGPoint(x: 60, y: 130))
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 50))
                path.addLine(to: CGPoint(x: 230, y: 130))
                path.addLine(to: CGPoint(x: 230, y: 250))
                path.addLine(to: CGPoint(x: 30, y: 250))
            }
            .fill(.blue)
            
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
        }
    }
}

struct CurveView_Previews: PreviewProvider {
    static var previews: some View {
        CurveView()
    }
}
