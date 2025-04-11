//
//  View+Extension.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

extension View {
    func fontStyle(_ fontCategory: AppFontCategory) -> some View {
        self.modifier(TextModifier(style: AppFontProvider.font(for: fontCategory)))
    }
}
