//
//  MathLogic.swift
//  Calculator
//
//  Created by Максим Бондарев on 04.05.2025.
//

import Foundation

final class MathLogic {
    var expression: [String] = []
    var actions: [Action] = []
    public var result: String = ""
    
    let actionsPririty: [Int: [Action]] = [
        1: [.percent],
        2: [.divide, .multiply],
        3: [.minus, .plus],
    ]
    
    init () {}
    
    func clear() {
        expression = ["0"]
        actions.removeAll()
        result = ""
    }
    
    func reload(expression: [String], actions: [Action]) {
        self.expression = expression
        self.actions = actions
    }
    
    func calculate() {
        for (_, value) in actionsPririty {
            for i in stride(from: actions.count > 1 ? actions.count - 1 : 0, to: 0, by: -1) {
                let action = actions[i]
                if value.contains(action) {
                    let num2 = expression.remove(at: i)
                    let num1 = expression[i]
                    guard let res = getAction(num1, num2, action) else {
                        result = "Error"
                        return
                    }
                    expression[i] = String(res)
                }
            }
            result = expression[0]
        }
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
            
            case .percent:
                return num1 * num2 / 100
        }
    }
}
