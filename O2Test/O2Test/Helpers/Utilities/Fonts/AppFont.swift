//
//  AppFont.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import SwiftUI

struct AppFont {
    let font: Font
    let size: CGFloat
    let weight: Font.Weight
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
    let paragraphSpacing: CGFloat?
    let listSpacing: CGFloat?
    
    init(font: Font, size: CGFloat, weight: Font.Weight, lineHeight: CGFloat, letterSpacing: CGFloat, paragraphSpacing: CGFloat? = nil, listSpacing: CGFloat? = nil) {
        self.font = font
        self.size = size
        self.weight = weight
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
        self.paragraphSpacing = paragraphSpacing
        self.listSpacing = listSpacing
    }
}
