//
//  ProgressView.swift
//  Animations-06
//
//  Created by Esther Huecas on 27/10/21.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("\(Int(progress*100))%")
                .font(.system(.title, design: .rounded)).bold()
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 12)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(isLoading ? .blue : .green, lineWidth: 12)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle.degrees(-90))
            
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.progress += 0.01
                if self.progress >= 1 {
                    self.isLoading = true
                    timer.invalidate()
                }
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
