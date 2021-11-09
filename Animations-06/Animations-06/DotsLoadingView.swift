//
//  DotsLoadingView.swift
//  Animations-06
//
//  Created by Esther Huecas on 27/10/21.
//

import SwiftUI

struct DotsLoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            ForEach(0...5, id: \.self) { index in
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(
                        .linear(duration: 0.5)
                            .repeatForever()
                            .delay(Double(index)/6))
            }
        }.onAppear() {
            self.isLoading = true
        }
    }
}

struct DotsLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DotsLoadingView()
    }
}
