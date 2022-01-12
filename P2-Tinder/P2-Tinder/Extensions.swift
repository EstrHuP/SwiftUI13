//
//  Extensions.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var trailingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .trailing)
                                    .combined(with: .move(edge: .bottom)))
    }
    static var leadingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .leading)
                                    .combined(with: .move(edge: .bottom)))
    }
    
    //TODO: - definir leadingTop / trailingTop
}
