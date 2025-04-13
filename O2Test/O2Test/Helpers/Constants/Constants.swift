//
//  Constants.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import Foundation

enum Dimension {
    enum radius {
        static let input: CGFloat = 12
        static let s: CGFloat = 20
    }
    
    enum opacity {
        static let half: CGFloat = 0.5
        static let hidden: CGFloat = 0
        static let show: CGFloat = 1
    }
    
    enum spacing {
        static let xs: CGFloat = 10
        static let s: CGFloat = 24
        static let m: CGFloat = 35
    }
    
    static let minOfChar: Int = 8
    
    static let zero: CGFloat = 0
    static let xs: CGFloat = 8
    static let s: CGFloat = 12
    static let m: CGFloat = 16
    static let l: CGFloat = 20
    static let xl: CGFloat = 30
    static let xxl: CGFloat = 55
    static let minusOffset: CGFloat = -40
    static let animOffset: CGFloat = 1000
}
