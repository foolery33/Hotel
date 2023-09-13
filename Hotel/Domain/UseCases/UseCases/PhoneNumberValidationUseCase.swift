//
//  PhoneNumberValidationUseCase.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import Foundation

final class PhoneNumberValidationUseCase {

    public func invoke(_ phoneNumber: String) -> Bool {
        let pattern = "^\\+7\\d{10}$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        return regex.firstMatch(in: phoneNumber, options: [], range: range) != nil
    }
    
}
