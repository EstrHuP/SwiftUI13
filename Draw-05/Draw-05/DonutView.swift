//
//  DonutView.swift
//  Draw-05
//
//  Created by Esther Huecas on 22/10/21.
//

import SwiftUI

struct DonutView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.3)
                .stroke(.blue, lineWidth: 60)
            
            Circle()
                .trim(from: 0.3, to: 0.5)
                .stroke(.green, lineWidth: 60)

            Circle()
                .trim(from: 0.5, to: 0.75)
                .stroke(.orange, lineWidth: 60)
            
            Circle()
                .trim(from: 0.75, to: 1)
                .stroke(.yellow, lineWidth: 70)
                .overlay(
                    Text("25%")
                        .font(.system(.title, design: .rounded)).bold()
                        .offset(x: 80, y: -100)
                )
            
        }
        .frame(width: 250, height: 250)
    }
}

struct DonutView_Previews: PreviewProvider {
    static var previews: some View {
        DonutView()
    }
}
