//
//  ContentView.swift
//  O2Test
//
//  Created by Roman on 09/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    var body: some View {
        VStack {
            PasswordInput(password: $password)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
