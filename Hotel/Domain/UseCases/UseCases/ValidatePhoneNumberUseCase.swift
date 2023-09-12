//
//  ValidatePhoneNumberUseCase.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import Foundation

final class ValidatePhoneNumberUseCase {

    public func invoke(_ phoneNumber: String) -> String {
        if phoneNumber.count == 19 {
            return insertSymbol(phoneNumber)
        } else if phoneNumber.count > 19 {
            var phoneNumber = phoneNumber
            phoneNumber.removeLast()
            return phoneNumber
        }
        return recoverSymbol(phoneNumber)
    }

    private func insertSymbol(_ input: String) -> String {
        var input = input
        if let lastSymbol = input.last {
            let stringSymbol = String(lastSymbol)
            guard Int(stringSymbol) != nil else {
                input.removeLast()
                return input
            }

            for (index, character) in input.enumerated() {
                if character == "*" {
                    let indexToReplace = input.index(input.startIndex, offsetBy: index)
                    input.replaceSubrange(indexToReplace...indexToReplace, with: stringSymbol)
                    input.removeLast()

                    return input
                }
            }
        }
        return ""
    }

    private func recoverSymbol(_ input: String) -> String {

        let numbers = "0123456789"
        var corruptedPhone = Array(input.map { String($0) })

        if corruptedPhone[0] != "+" {
            corruptedPhone.insert(contentsOf: ["+"], at: -1)
        } else if corruptedPhone[1] != "7" {
            corruptedPhone.insert(contentsOf: ["7"], at: 0)
        } else if corruptedPhone[2] != " " {
            corruptedPhone.insert(contentsOf: [" "], at: 1)
        } else if corruptedPhone[3] != "(" {
            corruptedPhone.insert(contentsOf: ["("], at: 2)
        } else if corruptedPhone[7] != ")" {
            corruptedPhone.insert(contentsOf: [")"], at: 6)
        } else if corruptedPhone[8] != " " {
            corruptedPhone.insert(contentsOf: [" "], at: 7)
        } else if corruptedPhone[12] != "-" {
            corruptedPhone.insert(contentsOf: ["-"], at: 11)
        } else if corruptedPhone[15] != "-" {
            corruptedPhone.insert(contentsOf: ["-"], at: 14)
        }

        let numberIndicies: [Int] = [4, 5, 6, 9, 10, 11, 13, 14, 16, 17]

        for numberIndex in numberIndicies {
            if !numbers.contains(corruptedPhone[numberIndex]) && corruptedPhone[numberIndex] != "*" {
                let followingIndicies = numberIndicies.filter { $0 >= numberIndex }
                for i in 0..<followingIndicies.count {
                    if i != followingIndicies.count - 1 {
                        corruptedPhone[followingIndicies[i]] = corruptedPhone[followingIndicies[i + 1]]
                    }
                }
                corruptedPhone[corruptedPhone.count - 1] = "*"
                return corruptedPhone.joined(separator: "")
            }
        }
        return corruptedPhone.joined(separator: "")
    }
    
}
