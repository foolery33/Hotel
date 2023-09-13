//
//  TouristInfoModel.swift
//  Hotel
//
//  Created by Nikita Usov on 12.09.2023.
//

import Foundation

struct TouristInfoModel: Identifiable {
    var id: UUID = UUID()

    var isErrorActive: Bool = false
    var name: String
    var surname: String
    var dateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var passportExpiration: String

    init(
        name: String,
        surname: String,
        dateOfBirth: String,
        citizenship: String,
        passportNumber: String,
        passportExpiration: String
    ) {
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
        self.citizenship = citizenship
        self.passportNumber = passportNumber
        self.passportExpiration = passportExpiration
    }

    init() {
        self.name = .init()
        self.surname = .init()
        self.dateOfBirth = .init()
        self.citizenship = .init()
        self.passportNumber = .init()
        self.passportExpiration = .init()
    }
}
