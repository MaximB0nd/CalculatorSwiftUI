//
//  MathLogic.swift
//  Calculator
//
//  Created by Максим Бондарев on 04.05.2025.
//

import Foundation

final class MathLogic {
    var expression: [String] = ["0"]
    var actions: [Action] = []
    var result: String = ""
    
    let actionsPririty: [Action: Int] = [
        .divide: 1,
        .multiply: 1,
        .minus: 2,
        .plus: 2
    ]
    
    init () {}
    
    func clear() {
        expression = ["0"]
        actions.removeAll()
    }
    
    func reload(expression: [String], actions: [Action]) {
        self.expression = expression
        self.actions = actions
    }
    
    func calculate() {
        for i in stride(from: actions.count, to: 0, by: -1) {
            let action = actions[i]
            let num2 = expression.remove(at: i)
            let num1 = expression.remove(at: i)
            guard let res = getAction(num1, num2, action) else {
                result = "Error"
                return
            }
            expression[i] = String(res)
        }
        result = expression[0]
    }
    
    func getAction(_ num1: String, _ num2: String, _ action: Action) -> Double? {
        let num1 = Double(num1)!
        let num2 = Double(num2)!
        switch action {
            case .plus:
                return num1 + num2
            case .minus:
                return num1 - num2
            case .multiply:
                return num1 * num2
            case .divide:
            guard num2 != 0 else {
                return nil
            }
                return num1 / num2
            default:
                return nil
        }
    }
}
