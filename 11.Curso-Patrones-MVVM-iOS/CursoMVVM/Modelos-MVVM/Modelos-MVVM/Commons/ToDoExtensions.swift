//
//  ToDoExtensions.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

extension View {
    public func cornerRadius(
        _ radius: CGFloat,
        corners: UIRectCorner) -> some View {
        clipShape(
            ToDoRoundedCorner(
                radius: radius,
                corners: corners
            ))
    }
    
    public func transparentScrolling() -> some View {
        return onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}
