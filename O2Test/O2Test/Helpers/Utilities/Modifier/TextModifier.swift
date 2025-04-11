//
//  TextModifier.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import SwiftUI

struct TextModifier: ViewModifier {
    let style: AppFont

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .lineSpacing(style.lineHeight - style.size)
            .kerning(style.letterSpacing)
    }
}
