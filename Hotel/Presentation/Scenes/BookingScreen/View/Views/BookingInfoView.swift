//
//  BookingInfoView.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import SwiftUI

struct BookingInfoView: View {

    // MARK: - Public Properties

    public let departure: String
    public let arrivalCountry: String
    public let tourDates: String
    public let numberOfNights: String
    public let hotelName: String
    public let room: String
    public let nutrition: String

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.softGray.swiftUIColor
            VStack(alignment: .leading, spacing: AppConstants.spacingMedium) {
                BookingDataView(dataName: R.string.localizable.flight_from(), dataInfo: departure)
                BookingDataView(dataName: R.string.localizable.country_city(), dataInfo: arrivalCountry)
                BookingDataView(dataName: R.string.localizable.dates(), dataInfo: tourDates)
                BookingDataView(dataName: R.string.localizable.nights_count(), dataInfo: numberOfNights)
                BookingDataView(dataName: R.string.localizable.hotel(), dataInfo: hotelName)
                BookingDataView(dataName: R.string.localizable.room(), dataInfo: room)
                BookingDataView(dataName: R.string.localizable.nutrition(), dataInfo: nutrition)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColors.white.swiftUIColor)
            )
        }
    }
}

// MARK: - Preview

struct BookingInfoView_Previews: PreviewProvider {
    static let departure: String = "sf"
    static let arrivalCountry: String = "sf"
    static let tourDates: String = "sf"
    static let numberOfNights: String = "sf"
    static let hotelName: String = "sf"
    static let room: String = "sf"
    static let nutrition: String = "sf"
    static var previews: some View {
        BookingInfoView(
            departure: departure,
            arrivalCountry: arrivalCountry,
            tourDates: tourDates,
            numberOfNights: numberOfNights,
            hotelName: hotelName,
            room: room,
            nutrition: nutrition
        )
    }
}
