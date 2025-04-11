//
//  AppFontCategory.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

enum LabelFontSize {
    case s, m
}

enum BodyLabelFontSize {
    case m
}

enum AppFontCategory {
    case label(_ fontSize: LabelFontSize)
    case body(_ fontSize: BodyLabelFontSize)
}



