//
//  SpecialButton.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 03.05.2025.
//

import SwiftUI


struct SpecialButton: View {
    
    @Binding var expression: [String]
    @Binding var position: ScrollPosition
    @Binding var actions: [Action]
    @Binding var mathLogic: MathLogic
    
    
    let path: String
    let action: () -> Void
    let isImage: Bool
    
    var body: some View {
        Button {
            action()
        }
        label: {
            if isImage { ButtonLabel(path: path) }
            else { ButtonLabel(symbol: path) }
        }
    }
    
    
    init (path: String = "", action: @escaping () -> Void,
          _ NumberButtonProperties: (expression: Binding<[String]>, actions: Binding<[Action]>, position: Binding<ScrollPosition>, MathLogic: Binding<MathLogic>, isResult: Binding<Bool>)) {
        
        self._actions = NumberButtonProperties.actions
        self._position = NumberButtonProperties.position
        self._expression = NumberButtonProperties.expression
        self.path = path
        self.action = action
        self.isImage = true
        self._mathLogic = NumberButtonProperties.MathLogic
    }
    
    init (symbol: String = "", action: @escaping () -> Void,
          _ NumberButtonProperties: (expression: Binding<[String]>, actions: Binding<[Action]>, position: Binding<ScrollPosition>, MathLogic: Binding<MathLogic>, isResult: Binding<Bool>)) {
        
        self._actions = NumberButtonProperties.actions
        self._position = NumberButtonProperties.position
        self._expression = NumberButtonProperties.expression
        self.path = symbol
        self.action = action
        self.isImage = false
        self._mathLogic = NumberButtonProperties.MathLogic
    }
}
