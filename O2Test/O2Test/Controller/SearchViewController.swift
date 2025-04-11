//
//  SearchViewController.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import SwiftUI

enum PasswordRule: CaseIterable, Identifiable {
    case specialCharacter, number, capitalLetter, length
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .specialCharacter: return "1 special character"
        case .number: return "1 number"
        case .capitalLetter: return "1 capital letter"
        case .length: return "8 characters"
        }
    }
    
    func validate(_ password: String) -> Bool {
        switch self {
        case .specialCharacter:
            return password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        case .number:
            return password.range(of: "[0-9]", options: .regularExpression) != nil
        case .capitalLetter:
            return password.range(of: "[A-Z]", options: .regularExpression) != nil
        case .length:
            return (password.count > 7)
        }
    }
}
