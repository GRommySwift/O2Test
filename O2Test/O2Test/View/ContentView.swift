//
//  ContentView.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var controller = SignUpViewController()
    
    
    var body: some View {
        ZStack {
            ScrollView {
                SignUpView(name: $controller.name, email: $controller.email, password: $controller.password, nameIsEmpty: $controller.nameISEmpty, emailIsEmpty: $controller.emailIsEmpty, action: controller.registration)
            }
            .padding()
            if controller.showPop {
                PopupView(name: controller.name, email: controller.email, action: controller.closePop)
            }
        }
    }
}

#Preview {
    ContentView()
}


