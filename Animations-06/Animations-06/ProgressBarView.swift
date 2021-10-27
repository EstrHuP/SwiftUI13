//
//  ProgressBarView.swift
//  Animations-06
//
//  Created by Esther Huecas on 27/10/21.
//

import SwiftUI

struct ProgressBarView: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.system(.title, design: .rounded)).bold()
                .offset(x: 0, y: -100)
            
            Text("\(Int(progress*100))%")
                .font(.system(.title, design: .rounded)).bold()
                .offset(x: 0, y: -50)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(.systemGray6), lineWidth: 10)
                    .frame(width: 300, height: 10)
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(isLoading ? .blue : .green, lineWidth: 10)
                    .frame(width: progress*300, height: 8)
                    .animation(.linear(duration: progress))
                
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    self.progress += 0.01
                    if self.progress >= 1 {
                        self.isLoading = true
                        timer.invalidate()
                    }
                }
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
