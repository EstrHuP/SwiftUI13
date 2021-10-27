//
//  LoadingBarView.swift
//  Animations-06
//
//  Created by Esther Huecas on 27/10/21.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.system(.title2, design: .rounded)).bold()
                .offset(x: 0, y: -30)
            
            RoundedRectangle(cornerRadius: 2)
                .stroke(Color(.systemGray6), lineWidth: 10)
                .frame(width: 300, height: 10)
            
            RoundedRectangle(cornerRadius: 2)
                .stroke(.green, lineWidth: 10)
                .frame(width: 40, height: 8)
                .offset(x: isLoading ? 120 : -120, y: 0)
                .animation(.linear(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
}

struct LoadingBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarView()
    }
}
