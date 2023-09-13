//
//  BookingScreenView.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI

struct BookingScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: BookingScreenViewModel

    // MARK: - Private Properties

    @FocusState private var focusField: FocusField?

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.white.swiftUIColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                GeneralNavigationBar(leftView: {
                    Button(action: {
                        viewModel.goBackToRoomScreen()
                    }, label: {
                        Image(uiImage: AppImages.chevronLeft)
                            .foregroundColor(AppColors.black.swiftUIColor)
                    })
                }, text: R.string.localizable.booking())
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Spacer()
                                .frame(maxWidth: .infinity)
                        }
                        Rectangle()
                            .fill(AppColors.softGray.swiftUIColor)
                            .frame(height: AppConstants.spacingTiny)
                        ZStack {
                            AppColors.softGray.swiftUIColor
                            VStack(alignment: .leading, spacing: AppConstants.spacingTiny) {
                                HStack(spacing: 2) {
                                    Image(uiImage: AppImages.star)
                                    Text(
                                        String(viewModel.bookingInformation.hotelRating) + " " + viewModel.bookingInformation.ratingName
                                    )
                                        .font(AppFonts.medium16)
                                        .foregroundColor(AppColors.orange.swiftUIColor)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.gold.swiftUIColor))
                                Text(viewModel.hotelName)
                                    .font(AppFonts.medium22)
                                    .foregroundColor(AppColors.black.swiftUIColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Button(action: {}) {
                                    Text(viewModel.bookingInformation.hotelAddress)
                                        .multilineTextAlignment(.leading)
                                        .font(AppFonts.medium14)
                                        .foregroundColor(AppColors.blue.swiftUIColor)
                                }
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(AppColors.white.swiftUIColor)
                            )
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            BookingInfoView(
                                departure: viewModel.bookingInformation.departure,
                                arrivalCountry: viewModel.bookingInformation.arrivalCountry,
                                tourDates: "\(viewModel.bookingInformation.tourDateStart)-\(viewModel.bookingInformation.tourDateStop)",
                                numberOfNights: "\(viewModel.bookingInformation.numberOfNights) ночей",
                                hotelName: viewModel.hotelName,
                                room: viewModel.bookingInformation.room,
                                nutrition: viewModel.bookingInformation.nutrition
                            )
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            ZStack {
                                AppColors.softGray.swiftUIColor
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(R.string.localizable.customer_info())
                                        .font(AppFonts.medium22)
                                        .foregroundColor(AppColors.black.swiftUIColor)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                        .frame(height: AppConstants.spacingLarge)
                                    VStack(alignment: .leading, spacing: AppConstants.spacingTiny) {
                                        GeneralTextField(
                                            text: $viewModel.phoneNumber,
                                            withLabel: true,
                                            label: R.string.localizable.phone_number(),
                                            verticalPadding: 10,
                                            submitLabel: .next,
                                            onSubmitAction: {
                                                focusField = .email
                                            },
                                            isEmptyError: false,
                                            isErrorActive: $viewModel.isInvalidPhoneNumber
                                        )
                                        .focused($focusField, equals: .phoneNumber)
                                        GeneralTextField(
                                            text: $viewModel.email,
                                            withLabel: true,
                                            label: R.string.localizable.email(),
                                            verticalPadding: 10,
                                            isAutocorrectionDisabled: true,
                                            autocapitalizationMode: .never,
                                            submitLabel: .done,
                                            onSubmitAction: {
                                                focusField = nil
                                            },
                                            onCommitAction: {
                                                viewModel.validateEmail()
                                            },
                                            isEmptyError: false,
                                            isErrorActive: $viewModel.isInvalidEmail
                                        )
                                        .focused($focusField, equals: .email)
                                        Text(R.string.localizable.confidential_data())
                                            .font(AppFonts.regular14)
                                            .foregroundColor(AppColors.gray.swiftUIColor)
                                    }
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColors.white.swiftUIColor)
                                )
                            }
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            ZStack {
                                AppColors.softGray.swiftUIColor
                                LazyVStack(alignment: .leading) {
                                    ForEach(0..<viewModel.touristList.count, id: \.self) { index in
                                        TouristInfoView(
                                            touristNumber: index + 1,
                                            name: $viewModel.touristList[index].name,
                                            surname: $viewModel.touristList[index].surname,
                                            dateOfBirth: $viewModel.touristList[index].dateOfBirth,
                                            citizenship: $viewModel.touristList[index].citizenship,
                                            passportNumber: $viewModel.touristList[index].passportNumber,
                                            passportExpiration: $viewModel.touristList[index].passportExpiration,
                                            isErrorActive: $viewModel.touristList[index].isErrorActive,
                                            isCollapsed: index != 0
                                        )
                                    }
                                }
                            }
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            ZStack {
                                AppColors.softGray.swiftUIColor
                                HStack {
                                    Text(R.string.localizable.add_tourist())
                                        .font(AppFonts.medium22)
                                        .foregroundColor(AppColors.black.swiftUIColor)
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            viewModel.touristList.append(.init())
                                        }
                                    }, label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(AppColors.blue.swiftUIColor)
                                                .frame(width: 32, height: 32)
                                            Image(uiImage: AppImages.plus)
                                                .foregroundColor(AppColors.white.swiftUIColor)
                                        }
                                    })
                                    .background(
                                        RoundedRectangle(cornerRadius: 6)
                                            .fill(AppColors.blue.swiftUIColor)
                                            .frame(width: 32, height: 32)
                                    )
                                }
                                .frame(height: 58)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColors.white.swiftUIColor)
                                )
                            }
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            ZStack {
                                AppColors.softGray.swiftUIColor
                                VStack(spacing: AppConstants.spacingMedium) {
                                    BookingPaymentView(paymentName: R.string.localizable.tour(), paymentAmount: viewModel.bookingInformation.tourPrice)
                                    BookingPaymentView(paymentName: R.string.localizable.fuel_charge(), paymentAmount: viewModel.bookingInformation.fuelCharge)
                                    BookingPaymentView(paymentName: R.string.localizable.service_charge(), paymentAmount: viewModel.bookingInformation.serviceCharge)
                                    BookingPaymentView(
                                        paymentName: R.string.localizable.to_payment(),
                                        paymentAmount: viewModel.bookingInformation.tourPrice +
                                        viewModel.bookingInformation.fuelCharge +
                                        viewModel.bookingInformation.serviceCharge,
                                        paymentDataFont: AppFonts.semibold16,
                                        paymentDataColor: AppColors.blue.swiftUIColor
                                    )
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColors.white.swiftUIColor)
                                )
                            }
                        }
                        Group {
                            Rectangle()
                                .fill(AppColors.softGray.swiftUIColor)
                                .frame(height: AppConstants.spacingTiny)
                            GeneralButton(
                                content: {
                                    Text(R.string.localizable.pay_value((viewModel.bookingInformation.tourPrice + viewModel.bookingInformation.fuelCharge + viewModel.bookingInformation.serviceCharge).formatToPrice()))
                                        .font(AppFonts.medium16)
                                },
                                action: {
                                    viewModel.validateAllFields()
                                },
                                color: AppColors.white.swiftUIColor,
                                cornerRadius: 15,
                                verticalPadding: 15
                            )
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(AppColors.white.swiftUIColor)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

// MARK: - Preview

struct BookingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BookingScreenView(
            viewModel: BookingScreenViewModel(
                dependencies: .init(
                    getBookingInformationUseCase: UseCaseProvider.instance.getBookingInformationUseCase,
                    phoneNumberValidationUseCase: UseCaseProvider.instance.validatePhoneNumberUseCase,
                    emailValidationUseCase: UseCaseProvider.instance.emailValidationUseCase
                )
            )
        )
    }
}

// MARK: - FocusField

private extension BookingScreenView {
    enum FocusField: Hashable {
        case phoneNumber
        case email
    }
}
