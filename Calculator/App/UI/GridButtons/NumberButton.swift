//
//  NumberButton.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 03.05.2025.
//

import SwiftUI


struct NumberButton: View {
    
    let symbol: String
    
    @Binding var expression: [String]
    @Binding var position: ScrollPosition
    @Binding var actions: [Action]
    @Binding var mathLogic: MathLogic
    
    var body: some View {
        Button {
            
            if !mathLogic.result.isEmpty { mathLogic.clear() }
            
            position.scrollTo(edge: .leading)
            if actions.count < expression.count {
                
                if (expression[expression.count-1].first == "0" || expression[expression.count-1].contains("-0")) && !expression[expression.count-1].contains("0.") {
                    expression[expression.count-1] = "\(expression[expression.count-1].contains("-0") ? "-" : "")\(symbol)"
                    return
                }
                
                expression[expression.count-1] += symbol
                return
            }
            expression.append(symbol)
            
            
        }
        label: {
            ButtonLabel(symbol: String(symbol))
        }
    }
    
    init(symbol: String, _ NumberButtonProperties: (expression: Binding<[String]>, actions: Binding<[Action]>, position: Binding<ScrollPosition>, MathLogic: Binding<MathLogic>)) {
        
        self._actions = NumberButtonProperties.actions
        self._position = NumberButtonProperties.position
        self._expression = NumberButtonProperties.expression
        self.symbol = symbol
        self._mathLogic = NumberButtonProperties.MathLogic
    }
}
