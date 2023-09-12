//
//  BookingScreenViewModel.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation
import Combine

final class BookingScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: BookingScreenSceneDelegate?

    @Published public var hotelName: String = .init()

    @Published private(set) var bookingInformation: BookingDomain = .init()
    @Published private(set) var error: String = ""
    @Published private(set) var isLoading: Bool = false

    @Published public var phoneNumber: String = "+7 (***) ***-**-**"
    @Published public var isInvalidPhoneNumber: Bool = false

    @Published public var email: String = ""
    @Published public var isInvalidEmail: Bool = false

    @Published public var touristList: [TouristInfoModel] = [.init()]

    private var subscribers: Set<AnyCancellable> = []

    // MARK: - Private Properties

    private let dependencies: Dependencies

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies

        initTextFieldsObserving()
    }

    // MARK: - Public Methods

    public func viewDidAppear() {
        getBookingInformation()
    }

    public func goBackToRoomScreen() {
        sceneDelegate?.goBackToRoomScreen()
    }

    public func getValidatedPhoneNumber(_ number: String) -> String {
        return dependencies.validatePhoneNumberUseCase.invoke(number)
    }

    public func validateEmail() {
        if !dependencies.emailValidationUseCase.invoke(email) {
            isInvalidEmail = true
        } else {
            isInvalidEmail = false
        }
    }

    public func validateAllFields() -> Bool {
        if !isInvalidEmail && !email.isEmpty && !isInvalidPhoneNumber && !phoneNumber.isEmpty {
            var isFoundEmptyField: Bool = false
            for (index, tourist) in touristList.enumerated() {
                if tourist.name.isEmpty || tourist.surname.isEmpty || tourist.citizenship.isEmpty ||
                    tourist.dateOfBirth.isEmpty || tourist.passportNumber.isEmpty || tourist.passportExpiration.isEmpty {
                    isFoundEmptyField = true
                    touristList[index].isErrorActive = true
                }
            }
            if !isFoundEmptyField {
                return true
            }
            return false
        }
        if !isInvalidEmail && email.isEmpty {
            isInvalidEmail = true
        }
        return false
    }

    // MARK: - Private Methods

    private func getBookingInformation() {
        isLoading = true
        dependencies.getBookingInformationUseCase.invoke { [weak self] result in
            self?.isLoading = false

            switch result {
            case .success(let domain):
                self?.bookingInformation = domain

            case.failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }

    private func initTextFieldsObserving() {
        initPhoneNumberTextObserving()
        initEmailTextObserving()
    }

    private func initPhoneNumberTextObserving() {
        $phoneNumber.sink { [self] _ in
            validateFields()
        }.store(in: &subscribers)
    }

    private func initEmailTextObserving() {
        $email.sink { [self] _ in
            validateFields()
        }.store(in: &subscribers)
    }

    @discardableResult private func validateFields() -> Bool {
        if !email.isEmpty && !dependencies.emailValidationUseCase.invoke(email) {
            isInvalidEmail = true
            return false
        } else {
            if !email.isEmpty && dependencies.emailValidationUseCase.invoke(email) {
                isInvalidEmail = false
            }
        }
        
        return true
    }

}

// MARK: - Nested Types

extension BookingScreenViewModel {
    struct Dependencies {
        let getBookingInformationUseCase: GetBookingInformationUseCase
        let validatePhoneNumberUseCase: ValidatePhoneNumberUseCase
        let emailValidationUseCase: EmailValidationUseCase
    }
}
