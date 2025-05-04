//
//  LabelButton.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 03.05.2025.
//

import SwiftUI

struct ButtonLabel: View {
    let symbol: String
    let imageName: String
    
    
    var body: some View {
        if imageName.isEmpty {
            Text("\(symbol)")
                .font(Font.system(size: 40))
                .minimumScaleFactor(0.2)
                .foregroundStyle(.white)
        }
        else {
            Image(systemName: imageName)
                .font(Font.system(size: 40))
                .foregroundStyle(.white)
            
        }
    }
    
    init (symbol: String) {
        self.symbol = symbol
        self.imageName = ""
    }
    
    init (path: String) {
        self.symbol = ""
        self.imageName = path
    }
}

#Preview {
    ButtonLabel(symbol: "1")
}
