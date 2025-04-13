//
//  PasswordInput.swift
//  O2Test
//
//  Created by Roman on 11/04/2025.
//

import SwiftUI

struct SignUpView: View {
    @FocusState var isActive
    @State var passwordIsOk = false
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    @Binding var nameIsEmpty: Bool
    @Binding var emailIsEmpty: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: Dimension.spacing.m) {
            topView(title: "Welcome", details: "Please sign-up in your account")
            NameAndEmailTF(text: $name, title: "Name")
            NameAndEmailTF(text: $email, title: "Email")
            PasswordInput(text: $password, passwordIsOk: $passwordIsOk)
            SignUpButton(passwordIsOk: $passwordIsOk, nameIsEmpty: $nameIsEmpty, emailIsEmpty: $emailIsEmpty, title: "Sign up", action: action)
        }
    }
}

#Preview {
    ContentView()
}

private extension SignUpView {
    func topView(title: String, details: String) -> some View {
        VStack(alignment: .leading, spacing: Dimension.m) {
            Text(title)
                .fontStyle(.label(.title))
            Text(details)
                .foregroundStyle(Color("color/surface/x-high"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    struct NameAndEmailTF: View {
        @FocusState var isActive
        @Binding var text: String
        var title: String
        
        var body: some View {
            ZStack(alignment: .leading) {
                TextField("", text: $text)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: Dimension.xxl).focused($isActive)
                    .background(Color("color/state/default/focus"), in: .rect(cornerRadius: Dimension.radius.input))
                Text(title)
                    .fontStyle(.body(.m))
                    .padding(.horizontal)
                    .offset(y: (isActive || !text.isEmpty) ? Dimension.minusOffset : Dimension.zero)
                    .animation(.spring, value: isActive)
                    .foregroundStyle(isActive ? Color("color/content/on-neutral/xx-high") : Color("color/content/on-neutral/medium"))
                    .onTapGesture {
                        isActive = true
                    }
            }
        }
    }
    
    struct SignUpButton: View {
        @Binding var passwordIsOk: Bool
        @Binding var nameIsEmpty: Bool
        @Binding var emailIsEmpty: Bool
        var title: String
        var action: () -> Void
        var body: some View {
            Button(action: {action()}, label: {
                Text(title)
                    .foregroundStyle(Color("color/surface/x-low"))
                    .fontStyle(.label(.xl))
                    .frame(maxWidth: .infinity)
                    .frame(height: Dimension.xxl)
                    .background(passwordIsOk ? Color("color/surface/brand") : Color("color/surface/x-high"), in: .rect(cornerRadius: Dimension.radius.input))
            })
            .tint(passwordIsOk ? Color("color/surface/brand") : Color("color/surface/x-high"))
            .overlay(
                RoundedRectangle(cornerRadius: Dimension.radius.input)
                    .opacity(Dimension.opacity.hidden)
                    .allowsHitTesting(passwordIsOk ? true : false)
            )
            .alert("Name is empty", isPresented: $nameIsEmpty) {
                Button("ok", role: .cancel) {}
            }
            .alert("Email is empty", isPresented: $emailIsEmpty) {
                Button("ok", role: .cancel) {}
            }
        }
    }
}





