//
//  MathLogic.swift
//  Calculator
//
//  Created by Максим Бондарев on 04.05.2025.
//

import SwiftUI

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
        expression.removeAll()
        actions.removeAll()
        result = ""
    }
    
    func reload(expression: [String], actions: [Action]) {
        self.expression = expression
        self.actions = actions
    }
    
    func calculate() {
        for j in stride(from: 1, through: 3, by: 1){
            var i = 0
            while i < actions.count {
                if actionsPririty[j]!.contains(actions[i]) {
                    let action = actions.remove(at: i)
                    let num2 = expression.remove(at: i+1)
                    let num1 = expression[i]
                    guard let res = getAction(num1, num2, action) else {
                        result = "Error"
                        return
                    }
                    expression[i] = String(res)
                }
                else {
                    i += 1
                }
            }
        }
        if Double(expression[0][..<expression[0].firstIndex(of: ".")!]) == Double(expression[0]){
            result = String(Int(expression[0][..<expression[0].firstIndex(of: ".")!])!)
        }
        else {
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
