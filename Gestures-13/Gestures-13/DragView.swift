//
//  DragView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 7/1/22.
//

import SwiftUI

struct DragView: View {
    
    @GestureState private var dragState = DragState.none
    //Gestos arrastre
    @State private var position = CGSize.zero
    
    var body: some View {
//        Image(systemName: "heart")
//            .font(.system(size: 100))
//            .foregroundColor(.purple)
//            .opacity(dragState.isPressing ? 0.5 : 1.0)
//            .offset(x: position.width + dragState.translation.width,
//                    y: position.height + dragState.translation.height)
//            .animation(.easeIn)
//            .gesture(
//                LongPressGesture(minimumDuration: 0.5)
//                    .sequenced(before: DragGesture())
//                    .updating($dragState) { (value, state, transaction) in
//                        switch value {
//                        case .first(true):
//                            state = .pressing
//                        case .second(true, let drag):
//                            state = .dragging(translation: drag?.translation ?? .zero)
//                        default:
//                            break
//                        }
//                    }
//                    .onEnded { (value) in
//                        guard case .second(true, let drag?) = value else {
//                            return
//                        }
//                        self.position.width += drag.translation.width
//                        self.position.height += drag.translation.height
//                    }
//            )
        
        DraggableView() {
            Text("👩🏻‍💻")
                .font(.system(size: 100))
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
