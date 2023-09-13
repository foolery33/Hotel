//
//  UseCaseProvider.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

final class UseCaseProvider {

    // MARK: - Singleton

    private init() {}

    static let instance = UseCaseProvider()

    // MARK: - Private Properties

    private lazy var networkServiceProvider: NetworkServiceProvider = .init()

    private lazy var repositoryProvider: RepositoryProvider = .init(
        networkServiceProvider: networkServiceProvider
    )

    // MARK: - Instances

    lazy var getHotelUseCase: GetHotelUseCase = {
        .init(hotelRepository: repositoryProvider.hotelRepository)
    }()

    lazy var getRoomUseCase: GetRoomUseCase = {
        .init(roomRepository: repositoryProvider.roomRepository)
    }()

    lazy var getBookingInformationUseCase: GetBookingInformationUseCase = {
        .init(bookingRepository: repositoryProvider.bookingRepository)
    }()

    lazy var validatePhoneNumberUseCase: PhoneNumberValidationUseCase = {
        .init()
    }()

    lazy var emailValidationUseCase: EmailValidationUseCase = {
        .init()
    }()

}
