//
//  ActionButton.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 03.05.2025.
//

import SwiftUI

struct ActionButton: View {
    let action: Action
    
    @Binding var expression: [String]
    @Binding var position: ScrollPosition
    @Binding var actions: [Action]
    @Binding var mathLogic: MathLogic
    
    
    var body: some View {
        Button {
            if !mathLogic.result.isEmpty { mathLogic.clear() }
            position.scrollTo(edge: .leading)
            if actions.count < expression.count {
                if expression[expression.count-1].last == "." {
                    expression[expression.count-1].removeLast()
                }
                actions.append(action)
                return
            }
            actions[actions.count-1] = action
            
        }
        
        label : {
            ButtonLabel(path: action.rawValue)
        }
    }
    
    init (action: Action, _ NumberButtonProperties: (expression: Binding<[String]>, actions: Binding<[Action]>, position: Binding<ScrollPosition>, MathLogic: Binding<MathLogic>)) {
        
        self._actions = NumberButtonProperties.actions
        self._position = NumberButtonProperties.position
        self._expression = NumberButtonProperties.expression
        
        self.action = action
        self._mathLogic = NumberButtonProperties.MathLogic
    }
          
}


