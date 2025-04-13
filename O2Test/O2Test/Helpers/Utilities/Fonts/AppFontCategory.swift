//
//  AppFontCategory.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

enum LabelFontSize {
    case s, m, xl, title
}

enum BodyLabelFontSize {
    case m, xl
}

enum AppFontCategory {
    case label(_ fontSize: LabelFontSize)
    case body(_ fontSize: BodyLabelFontSize)
}



