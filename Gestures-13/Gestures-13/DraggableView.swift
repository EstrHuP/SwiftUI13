//
//  DraggableView.swift
//  Gestures-13
//
//  Created by Esther Huecas on 7/1/22.
//

import SwiftUI

struct DraggableView<T>: View where T: View {
    
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var content: () -> T
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width,
                    y: position.height + dragState.translation.height)
            .animation(.easeIn)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .sequenced(before: DragGesture())
                    .updating($dragState) { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
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

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView() {
            Image(systemName: "heart")
                .font(.system(size: 100))
                .foregroundColor(.purple)
        }
    }
}


enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(translation: let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
}

