//
//  RoomScreenSceneDelegate.swift
//  Hotel
//
//  Created by Nikita Usov on 08.09.2023.
//

import Foundation

protocol RoomScreenSceneDelegate: AnyObject {
    func goToBookingScreen(hotelName: String)
    func goBackToHotelScreen()
}
