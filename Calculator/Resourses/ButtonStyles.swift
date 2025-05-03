//
//  ButtonStyles.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 26.04.2025.
//

import SwiftUI

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.red)
            .padding(10)
            .background(Color.red)
            .cornerRadius(5)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct NumberButtonStyle: ButtonStyle {
    
    let color: CustomColors
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
            .background(configuration.isPressed ? .white : Color(color))
            .opacity(configuration.isPressed ? 0.9 : 1)
            .cornerRadius(180)
            .aspectRatio(1, contentMode: .fit)
            
    }
}


