//
//  BookingDomain.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct BookingDomain {
    let id: Int
    let hotelName: String
    let hotelAddress: String
    let hotelRating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int

    init(
        id: Int,
        hotelName: String,
        hotelAddress: String,
        hotelRating: Int,
        ratingName: String,
        departure: String,
        arrivalCountry: String,
        tourDateStart: String,
        tourDateStop: String,
        numberOfNights: Int,
        room: String,
        nutrition: String,
        tourPrice: Int,
        fuelCharge: Int,
        serviceCharge: Int
    ) {
        self.id = id
        self.hotelName = hotelName
        self.hotelAddress = hotelAddress
        self.hotelRating = hotelRating
        self.ratingName = ratingName
        self.departure = departure
        self.arrivalCountry = arrivalCountry
        self.tourDateStart = tourDateStart
        self.tourDateStop = tourDateStop
        self.numberOfNights = numberOfNights
        self.room = room
        self.nutrition = nutrition
        self.tourPrice = tourPrice
        self.fuelCharge = fuelCharge
        self.serviceCharge = serviceCharge
    }

    init() {
        self.id = .init()
        self.hotelName = .init()
        self.hotelAddress = .init()
        self.hotelRating = .init()
        self.ratingName = .init()
        self.departure = .init()
        self.arrivalCountry = .init()
        self.tourDateStart = .init()
        self.tourDateStop = .init()
        self.numberOfNights = .init()
        self.room = .init()
        self.nutrition = .init()
        self.tourPrice = .init()
        self.fuelCharge = .init()
        self.serviceCharge = .init()
    }
}
