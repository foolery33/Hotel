//
//  HotelScreenView.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import SwiftUI
import Kingfisher
import SwiftUIFlowLayout

struct HotelScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: HotelScreenViewModel

    // MARK: - Private Properties

    @State private var selectedImageIndex = 0

    // MARK: - Body

    var body: some View {
        ZStack(alignment: .top) {
            AppColors.white.swiftUIColor
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                GeneralNavigationBar(
                    leftView: {},
                    text: R.string.localizable.hotel()
                )
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        ZStack {
                            AppColors.softGray.swiftUIColor
                            VStack(alignment: .leading, spacing: 0) {
                                ImageCarouselView(imageUrls: viewModel.hotel.imageUrls)
                                Spacer()
                                    .frame(height: AppConstants.spacingMedium)
                                HStack(spacing: 2) {
                                    Image(uiImage: AppImages.star)
                                    Text(
                                        String(viewModel.hotel.rating) + " " + viewModel.hotel.ratingName
                                    )
                                        .font(AppFonts.medium16)
                                        .foregroundColor(AppColors.orange.swiftUIColor)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.gold.swiftUIColor))
                                Spacer()
                                    .frame(height: AppConstants.spacingTiny)
                                Text(viewModel.hotel.name)
                                    .font(AppFonts.medium22)
                                    .foregroundColor(AppColors.black.swiftUIColor)
                                Spacer()
                                    .frame(height: AppConstants.spacingTiny)
                                Button(action: {}) {
                                    Text(viewModel.hotel.address)
                                        .multilineTextAlignment(.leading)
                                        .font(AppFonts.medium14)
                                        .foregroundColor(AppColors.blue.swiftUIColor)
                                }
                                Spacer()
                                    .frame(height: AppConstants.spacingMedium)
                                HStack(alignment: .firstTextBaseline, spacing: AppConstants.spacingTiny) {
                                    Text(R.string.localizable.from_price(viewModel.hotel.minimalPrice.formatToPrice()))
                                        .font(AppFonts.semibold30)
                                        .foregroundColor(AppColors.black.swiftUIColor)
                                        .fixedSize()
                                    Text(R.string.localizable.for_tour_with_flight())
                                        .font(AppFonts.medium14)
                                        .foregroundColor(AppColors.gray.swiftUIColor)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding([.horizontal, .bottom], 16)
                            .background(AppColors.white.swiftUIColor)
                            .modifier(CornerRadiusModifier(
                                radius: 12,
                                corners: [.bottomLeft, .bottomRight]
                            ))
                        }

                        Rectangle()
                            .fill(AppColors.softGray.swiftUIColor)
                            .frame(height: AppConstants.spacingTiny)

                        ZStack {
                            AppColors.softGray.swiftUIColor
                            VStack(alignment: .leading, spacing: 0) {
                                Text(R.string.localizable.about_hotel())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(AppFonts.medium22)
                                    .foregroundColor(AppColors.black.swiftUIColor)
                                Spacer()
                                    .frame(height: AppConstants.spacingMedium)
                                FlowLayout(
                                    mode: .scrollable,
                                    items: viewModel.hotel.aboutTheHotel.peculiarities,
                                    itemSpacing: 4
                                ) {
                                    Text($0)
                                        .font(AppFonts.medium16)
                                        .foregroundColor(AppColors.gray.swiftUIColor)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(AppColors.softWhite.swiftUIColor)
                                        )
                                }
                                .padding(-4)
                                Spacer()
                                    .frame(height: AppConstants.spacingSmall)
                                Text(viewModel.hotel.aboutTheHotel.description)
                                    .font(AppFonts.regular16)
                                    .foregroundColor(AppColors.black.swiftUIColor)
                                Spacer()
                                    .frame(height: AppConstants.spacingMedium)
                                VStack(spacing: 10) {
                                    AboutHotelButton(
                                        image: Image(uiImage: AppImages.emojiHappy),
                                        buttonName: R.string.localizable.convenience(),
                                        buttonType: R.string.localizable.essentials()
                                    )
                                    AboutHotelButton(
                                        image: Image(uiImage: AppImages.tickSquare),
                                        buttonName: R.string.localizable.included(),
                                        buttonType: R.string.localizable.essentials()
                                    )
                                    AboutHotelButton(
                                        image: Image(uiImage: AppImages.closeSquare),
                                        buttonName: R.string.localizable.not_included(),
                                        buttonType: R.string.localizable.essentials(),
                                        withSeparator: false
                                    )
                                }
                                .padding(15)
                                .background(RoundedRectangle(cornerRadius: 15).fill(AppColors.softWhite.swiftUIColor))
                            }
                            .padding(16)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.white.swiftUIColor))
                        }
                        Rectangle()
                            .fill(AppColors.softGray.swiftUIColor)
                            .frame(height: AppConstants.spacingSmall)
                        GeneralButton(
                            content: {
                                Text(R.string.localizable.to_room_list())
                                    .font(AppFonts.medium16)
                            },
                            action: {
                                viewModel.goToRoomScreen()
                            },
                            color: AppColors.white.swiftUIColor,
                            cornerRadius: 15,
                            verticalPadding: 15
                        )
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(AppColors.white.swiftUIColor)
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

struct HotelScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HotelScreenView(
            viewModel: .init(
                dependencies: .init(
                    getHotelUseCase: UseCaseProvider.instance.getHotelUseCase
                )
            )
        )
        .preferredColorScheme(.dark)
    }
}
