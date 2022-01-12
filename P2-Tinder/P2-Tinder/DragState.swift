//
//  DragState.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import Foundation
import SwiftUI

enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
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
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        default:
            return false
        }
    }
}
