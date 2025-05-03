//
//  CustomColors.swift
//  SwiftUILessons
//
//  Created by Максим Бондарев on 22.03.2025.
//

import SwiftUI

enum CustomColors: String {
    case Accent
    case BgLight
    case OffButton
    case NumbersButton
    case ActionsButton
    case BackButton
    
}

extension Color {
    init(_ customColor: CustomColors){
        self.init(customColor.rawValue)
    }
}
