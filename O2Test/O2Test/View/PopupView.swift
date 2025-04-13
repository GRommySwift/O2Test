//
//  SwiftUIView.swift
//  O2Test
//
//  Created by Roman on 13/04/2025.
//

import SwiftUI

struct PopupView: View {
    let name: String
    let email: String
    let action: () -> Void
    @State private var offset: CGFloat = Dimension.animOffset
    
    var body: some View {
        ZStack {
            Color("color/content/on-neutral/xx-high").opacity(Dimension.opacity.half)
            VStack {
                Text("Registration complete!")
                    .fontStyle(.label(.xl))
                    .padding()
                Text("Hello \(name)")
                    .fontStyle(.body(.xl))
                Text("Your email is: \(email)")
                    .fontStyle(.body(.xl))
                
                Button {
                    action()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: Dimension.radius.s)
                            .foregroundColor(Color("color/surface/danger"))
                        
                        Text("Okay")
                            .fontStyle(.body(.xl))
                            .foregroundColor(Color("color/surface/x-low"))
                            .padding()
                    }
                    .padding()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    offset = Dimension.animOffset
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color("color/surface/x-low"))
            .clipShape(RoundedRectangle(cornerRadius: Dimension.radius.s))
            .shadow(radius: Dimension.radius.s)
            .padding(Dimension.xl)
            .offset(x: Dimension.zero, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = Dimension.zero
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PopupView(name: "Roman", email: "romaasd@asdasd.com", action: {})
}
