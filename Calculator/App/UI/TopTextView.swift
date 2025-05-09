//
//  TopTextView.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 17.04.2025.
//

import SwiftUI

struct TopTextView: View {
    
    @Binding var expression: [String]
    @Binding var actions: [Action]
    @Binding var position: ScrollPosition
    @Binding var mathLogic: MathLogic
    @Binding var isResult: Bool
    
    
    var body: some View {
        
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (0...(actions.count+expression.count-1), id: \.self ) { i in
                        HStack {
                            if i % 2 == 0 {
                                
                                let exp = expression[i/2]
                                
                                if exp.contains("-") {
                                    Image(systemName: "minus")
                                        .multilineTextAlignment(.trailing)
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .font(Font.system(size: isResult ? 30 : 70, weight: .medium))
                                    
                                }
                                
                                
                                Text(exp.contains("-") ? String(exp.dropFirst()) : exp).multilineTextAlignment(.trailing)
                                    .foregroundStyle(.white)
                                    .font(Font.system(size: isResult ? 30 : 90, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                
                            }
                            else {
                                Image(systemName: "\(actions[(i-1)/2].rawValue)")
                                    .multilineTextAlignment(.trailing)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .font(Font.system(size: isResult ? 30 : 70, weight: .medium))
                                    
                                
                                
                            }
                        }
                    }
                    
                }
                .padding([.leading, .trailing], 30)
                .scaleEffect(x: -1, y: 1)
                
                
                
            }
            .scrollPosition($position)
            .scrollBounceBehavior(.basedOnSize, axes: [.horizontal])
            .fixedSize(horizontal: false, vertical: true)
            .scaleEffect(x: -1, y: 1)
            
            
            
            
            if isResult {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        if mathLogic.result.contains("-") {
                            Image(systemName: "minus")
                                .multilineTextAlignment(.trailing)
                                .foregroundStyle(.white)
                                .font(Font.system(size: 60, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        Text(mathLogic.result.contains("-") ? String(mathLogic.result.dropFirst()) : mathLogic.result).multilineTextAlignment(.trailing)
                            .foregroundStyle(.white)
                            .font(Font.system(size: 90, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding([.leading, .trailing], 30)
                    .scaleEffect(x: -1, y: 1)
                    
                }
                .scrollPosition($position)
                .scrollBounceBehavior(.basedOnSize, axes: [.horizontal])
                .fixedSize(horizontal: false, vertical: true)
                .scaleEffect(x: -1, y: 1)
            }
        }
    }
        
    
    
    
}

struct prev: PreviewProvider {
        
    @State static var expression: [String] = ["-123", "124", "125"]
    @State static var position = ScrollPosition(edge: .leading)
    @State static var actions: [Action] = [.plus, .divide]
    @State static var result = MathLogic()
    @State static var isResult: Bool = false
    
    
    static var previews: some View {
        ZStack {
            Rectangle().ignoresSafeArea(edges: .all)
            TopTextView(expression: $expression, actions: $actions, position: $position, mathLogic: $result, isResult: $isResult)
        }
    }
}


