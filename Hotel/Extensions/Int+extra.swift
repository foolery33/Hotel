//
//  Int+extra.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import Foundation

extension Int {
    func formatToPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
