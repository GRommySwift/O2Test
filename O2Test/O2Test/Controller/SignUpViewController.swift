//
//  SignUpViewController.swift
//  O2Test
//
//  Created by Roman on 13/04/2025.
//

import SwiftUI
import Observation

@Observable
@MainActor
class SignUpViewController {
    var name = ""
    var email = ""
    var password = ""
    var showPop = false
    var nameISEmpty = false
    var emailIsEmpty = false
    
    func registration() {
        if !name.isEmpty {
            if !email.isEmpty {
                nameISEmpty = false
                emailIsEmpty = false
                showPop = true
            } else {
                emailIsEmpty = true
            }
        } else {
            nameISEmpty = true
        }
    }
    
    func closePop() {
        name = ""
        email = ""
        password = ""
        showPop = false
    }
}
