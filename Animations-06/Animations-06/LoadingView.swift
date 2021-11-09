//
//  LoadingView.swift
//  Animations-06
//
//  Created by Esther Huecas on 27/10/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 16)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(.green, lineWidth: 8)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 1.3).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
