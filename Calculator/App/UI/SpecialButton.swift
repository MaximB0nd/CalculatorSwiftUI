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
    
    let path: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }
        label: {
            ButtonLabel(path: path)
        }
    }
    
    
    init (path: String = "", action: @escaping () -> Void,
          _ NumberButtonProperties: (expression: Binding<[String]>, actions: Binding<[Action]>, position: Binding<ScrollPosition>)) {
        
        self._actions = NumberButtonProperties.actions
        self._position = NumberButtonProperties.position
        self._expression = NumberButtonProperties.expression
        self.path = path
        self.action = action
    }
}
