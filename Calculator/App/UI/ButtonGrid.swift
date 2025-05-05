//
//  ButtonGrid.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 17.04.2025.
//

import SwiftUI


struct ButtonGrid: View {
    
    @Binding var expression: [String]
    @Binding var actions: [Action]
    @Binding var position: ScrollPosition
    @Binding var mathLogic: MathLogic
    
    var body: some View {
       
        let ButtonProprety = (expression: $expression, actions: $actions, position: $position, MathLogic: $mathLogic)
        
        let deleteAction: () -> Void = {
            if actions.count < expression.count {
                
                expression[expression.count-1].removeLast()
                
                if expression[expression.count-1].isEmpty || expression[0] == "-" {
                    if expression.count == 1 {
                        expression[0] = "0"
                    }
                    else {
                        expression.removeLast()
                    }
                }
                return
            }
            actions.removeLast()
        }
        
        // rewrite it to cool understanding
        let plusSlashMinusAction: () -> Void = {
            if actions.count >= 1 && actions[actions.count-1] == .plus {
                actions[actions.count-1] = .minus
                return
            }
            else if actions.count >= 1 && actions[actions.count-1] == .minus {
                actions[actions.count-1] = .plus
                return
                }
            else if actions.count < expression.count {
                if expression[expression.count-1].first == "-" {
                expression[expression.count-1].removeFirst(1)
            }
                else {
                    expression[expression.count-1] = "-" + expression[expression.count-1]
                }
                return
            }
        
        
        expression.append("-0")
        }
        
        let dotAction: () -> Void = {
            if actions.count < expression.count {
                if !expression[expression.count-1].contains(".") {
                    expression[expression.count-1] += "."
                }
                return
            }
            expression.append("0.")
        }
        
        let equelAction: () -> Void = {
            if expression.count > actions.count {
                
                
                mathLogic.reload(expression: expression, actions: actions)
                mathLogic.calculate()
                print(mathLogic.result)
            }
        }
        
        Grid(horizontalSpacing: 10, verticalSpacing: 10) {
            
            
            GridRow {
                SpecialButton(path: "delete.left", action: deleteAction, ButtonProprety).buttonStyle(NumberButtonStyle(color: .BackButton))
//                    .onLongPressGesture(minimumDuration: 0.5) {
//                        while !actions.isEmpty {
//                            expression.removeLast()
//                            actions.removeLast()
//                        }
//                        expression.removeLast()
//                    }
                SpecialButton(path: "plus.forwardslash.minus", action: plusSlashMinusAction, ButtonProprety).buttonStyle(NumberButtonStyle(color: .BackButton))
                ActionButton(action: .percent, ButtonProprety).buttonStyle(NumberButtonStyle(color: .BackButton))
                ActionButton(action: .divide, ButtonProprety).buttonStyle(NumberButtonStyle(color: .ActionsButton))
                
               
            }
            GridRow {
                NumberButton(symbol: "7", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "8", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "9", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                ActionButton(action: .multiply, ButtonProprety).buttonStyle(NumberButtonStyle(color: .ActionsButton))
                
                
            }
            GridRow {
                NumberButton(symbol: "4", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "5", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "6", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                ActionButton(action: .minus, ButtonProprety).buttonStyle(NumberButtonStyle(color: .ActionsButton))
            }
            GridRow {
                NumberButton(symbol: "1", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "2", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                NumberButton(symbol: "3", ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                ActionButton(action: .plus, ButtonProprety).buttonStyle(NumberButtonStyle(color: .ActionsButton))
            }
            GridRow {
                NumberButton(symbol: "0", ButtonProprety)
                    .gridCellColumns(2)
                    .buttonStyle(ZeroButtonStyle(color: .NumbersButton))
                SpecialButton(symbol: ",", action: dotAction, ButtonProprety).buttonStyle(NumberButtonStyle(color: .NumbersButton))
                    
                SpecialButton(path: "equal", action: equelAction, ButtonProprety).buttonStyle(NumberButtonStyle(color: .ActionsButton))
            }
        }.padding(10)
           
    }
    
    
}

struct ButtonGridPreview: PreviewProvider {
    
    @State static var position = ScrollPosition(edge: .trailing)
    @State static var actions: [Action] = []
    @State static var expression: [String] = ["0"]
    @State static var result = MathLogic()
    
    static var previews: some View {
        ZStack {
            Rectangle()
            ButtonGrid(expression: $expression, actions: $actions, position: $position, mathLogic: $result)
        }.ignoresSafeArea(.all)
    }
}
