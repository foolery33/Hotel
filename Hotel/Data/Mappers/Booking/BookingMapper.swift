//
//  BookingMapper.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct BookingMapper: Mapper {
    typealias Response = BookingResponse
    typealias Domain = BookingDomain

    func call(_ response: Response) -> Domain {
        .init(
            id: response.id,
            hotelName: response.hotelName,
            hotelAddress: response.hotelAddress,
            hotelRating: response.hotelRating,
            ratingName: response.ratingName,
            departure: response.departure,
            arrivalCountry: response.arrivalCountry,
            tourDateStart: response.tourDateStart,
            tourDateStop: response.tourDateStop,
            numberOfNights: response.numberOfNights,
            room: response.room,
            nutrition: response.nutrition,
            tourPrice: response.tourPrice,
            fuelCharge: response.fuelCharge,
            serviceCharge: response.serviceCharge
        )
    }
}
