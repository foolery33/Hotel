//
//  Color+UIColor.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import SwiftUI
import UIKit

extension Color {
    init(uiColor: UIColor) {
        self.init(red: Double(uiColor.rgba.red),
                  green: Double(uiColor.rgba.green),
                  blue: Double(uiColor.rgba.blue),
                  opacity: Double(uiColor.rgba.alpha))
    }
}

