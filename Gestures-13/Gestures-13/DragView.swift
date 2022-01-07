//
//  DragView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 7/1/22.
//

import SwiftUI

struct DragView: View {
    
    //Gestos prolongados
    @GestureState private var isHasBeenLongPressed = false
    
    //Gestos arrastre
    @State private var position = CGSize.zero
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        Image(systemName: "heart")
            .font(.system(size: 100))
            .foregroundColor(.purple)
            .offset(x: position.width + offset.width,
                    y: position.height + offset.height)
            .animation(.easeIn)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($isHasBeenLongPressed) { (value, state, transaction) in
                        state = value
                    }
                    .sequenced(before: DragGesture())
                    .updating($offset) { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            print("El gesto es un tap")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    }
                    .onEnded { (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    }
            )
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
