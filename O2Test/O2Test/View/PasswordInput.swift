//
//  PasswordInput.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import SwiftUI

struct PasswordInput: View {
    @Binding var password: String
    
    private var rules: [PasswordRule] = PasswordRule.allCases
    
    init(password: Binding<String>, rules: [PasswordRule] = PasswordRule.allCases) {
        self._password = password
        self.rules = rules
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            SecureField("Create Password", text: $password)
                .textContentType(.newPassword)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(rules) { rule in
                    HStack(spacing: 8) {
                        Image(systemName: rule.validate(password) ? "checkmark.circle.fill" : "xmark.circle")
                            .foregroundColor(rule.validate(password) ? .green : .red)
                        Text(rule.description)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.top, 4)
        }
    }
}

#Preview {
    PasswordInput(password: .constant(""))
}
