//
//  PasswordInput.swift
//  O2Test
//
//  Created by Roman on 13/04/2025.
//

import SwiftUI

struct PasswordInput: View {
    @FocusState var isActive
    @State var checkMinChars = false
    @State var checkLetter = false
    @State var checkSpecialCharacters = false
    @State var checkNumbers = false
    @State var showPassword = false
    @Binding var text: String
    @Binding var passwordIsOk: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.spacing.s) {
            ZStack(alignment: .leading) {
                ZStack {
                    SecureField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: Dimension.xxl).focused($isActive)
                        .background(Color("color/state/default/focus"), in: .rect(cornerRadius: Dimension.radius.input))
                        .opacity(showPassword ? Dimension.opacity.hidden : Dimension.opacity.show)
                    
                    TextField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: Dimension.xxl).focused($isActive)
                        .background(Color("color/state/default/focus"), in: .rect(cornerRadius: Dimension.radius.input))
                        .opacity(showPassword ? Dimension.opacity.show : Dimension.opacity.hidden)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: Dimension.radius.input)
                        .stroke(passwordIsOk ? Color("color/content/on-neutral/low") : Color("color/content/on-neutral/danger"))
                )
                
                Text("Password")
                    .fontStyle(.body(.m))
                    .padding(.horizontal)
                    .offset(y: (isActive || !text.isEmpty) ? Dimension.minusOffset : Dimension.zero)
                    .animation(.spring, value: isActive)
                    .foregroundStyle(isActive ? Color("color/content/on-neutral/xx-high") : Color("color/content/on-neutral/medium"))
                    .onTapGesture {
                        isActive = true
                    }
                    .onChange(of: text) { oldValue, newValue in
                        withAnimation {
                            checkMinChars = newValue.count >= Dimension.minOfChar
                            checkLetter = newValue.rangeOfCharacter(from: .uppercaseLetters) != nil
                            checkNumbers = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                            checkSpecialCharacters = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&")) != nil
                        }
                        if checkMinChars && checkLetter && checkNumbers && checkSpecialCharacters == true {
                            passwordIsOk = true
                        } else {
                            passwordIsOk = false
                        }
                    }
            }
            .overlay(alignment: .trailing) {
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding(Dimension.m)
                    .containerShape(Rectangle())
                    .foregroundStyle(showPassword ? Color("color/surface/brand") : Color("color/content/on-neutral/medium"))
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
            VStack(alignment: .leading, spacing: Dimension.spacing.xs) {
                CheckText(text: "Minimum 8 characters", check: $checkMinChars)
                CheckText(text: "At least one capital letter", check: $checkLetter)
                CheckText(text: "Special symbols @#$%^", check: $checkSpecialCharacters)
                CheckText(text: "Number", check: $checkNumbers)
            }
        }
    }
}

#Preview {
    ContentView()
}

private extension PasswordInput {
    struct CheckText: View {
        let text: String
        @Binding var check: Bool
        var body: some View {
            HStack {
                Image(systemName: check ? "checkmark.circle.fill" : "circle")
                    .contentTransition(.symbolEffect)
                Text(text)
            }
            .foregroundStyle(check ? Color("color/surface/brand") : Color("color/surface/danger"))
        }
    }
}
