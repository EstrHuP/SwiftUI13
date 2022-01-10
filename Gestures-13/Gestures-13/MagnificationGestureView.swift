//
//  MagnificationGestureView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 10/1/22.
//

import SwiftUI

struct MagnificationGestureView: View {
    
    @State var scale = 1.0
    
    var body: some View {
        Text("🐜")
            .font(.system(size: 100))
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged({ value in
                        scale = value
                    })
                    .onEnded({ _ in
                        withAnimation {
                            scale = 1.0
                        }
                    })
            )
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}
