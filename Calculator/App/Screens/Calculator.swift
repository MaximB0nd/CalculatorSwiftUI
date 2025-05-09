//
//  Calculator.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 17.04.2025.
//

import SwiftUI

enum Action: String {
    case divide 
    case plus
    case minus
    case multiply
    case percent
}

struct CalculatorView: View {
    
    
    @State var expression: [String] = ["0"]
    @State var actions: [Action] = []
    @State var expResult = MathLogic()
    @State var position = ScrollPosition(edge: .leading)
    @State var isResult: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            
            TopTextView(expression: $expression, actions: $actions, position: $position, mathLogic: $expResult, isResult: $isResult)
            
            ButtonGrid(expression: $expression, actions: $actions, position: $position, mathLogic: $expResult, isResult: $isResult)
            
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
        .background(.black)
        
        
    }
    

}


struct CalculatorScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
 }


