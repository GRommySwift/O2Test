//
//  TextStyle.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

struct AppFontProvider {
    static func font(for category: AppFontCategory) -> AppFont {
        switch (category) {
        case .label(fontSize: .m):
            return AppFont(
                font: .custom("Inter", size: 14),
                size: 14,
                weight: .medium,
                lineHeight: 20,
                letterSpacing: 0.1
            )
        case .label(fontSize: .s):
            return AppFont(
                font: .custom("Inter", size: 12),
                size: 12,
                weight: .medium,
                lineHeight: 16,
                letterSpacing: 0.1
            )
        case .label(.xl):
            return AppFont(
                font: .custom("Inter", size: 20),
                size: 20,
                weight: .bold,
                lineHeight: 28,
                letterSpacing: 0.1
            )
        case .label(.title):
            return AppFont(
                font: .custom("Inter", size: 30),
                size: 30,
                weight: .bold,
                lineHeight: 38,
                letterSpacing: 0.1
            )
        case .body(fontSize: .m):
            return AppFont(
                font: .custom("Inter", size: 14),
                size: 14,
                weight: .regular,
                lineHeight: 20,
                letterSpacing: 0.1,
                paragraphSpacing: 20,
                listSpacing: 6
            )
        case .body(fontSize: .xl):
            return AppFont(
                font: .custom("Inter", size: 18),
                size: 18,
                weight: .regular,
                lineHeight: 20,
                letterSpacing: 0.1,
                paragraphSpacing: 20,
                listSpacing: 6
            )
        }
    }
}
