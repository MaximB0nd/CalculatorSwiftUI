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
    
    
    var body: some View {
        
    
        
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
                                    .font(Font.system(size: 60, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            
                            Text(exp.contains("-") ? String(exp.dropFirst()) : exp).multilineTextAlignment(.trailing)
                                .foregroundStyle(.white)
                                .font(Font.system(size: 90, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                
                        }
                        else {
                            Image(systemName: "\(actions[(i-1)/2].rawValue)")
                                .multilineTextAlignment(.trailing)
                                .foregroundStyle(.white)
                                .font(Font.system(size: 60, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                
                            
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
            
    }
    
}

struct prev: PreviewProvider {
        
    @State static var expression: [String] = ["123", "124", "125"]
    @State static var position = ScrollPosition(edge: .leading)
    @State static var actions: [Action] = [.plus, .divide]
    
    static var previews: some View {
        ZStack {
            Rectangle().ignoresSafeArea(edges: .all)
            TopTextView(expression: $expression, actions: $actions, position: $position)
        }
    }
}
