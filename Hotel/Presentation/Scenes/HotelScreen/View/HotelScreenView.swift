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
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        AppColors.softGray.swiftUIColor
                        VStack(alignment: .leading, spacing: 0) {
                            GeneralNavigationBar(
                                leftView: {},
                                text: "Отель"
                            )
                            ImageCarouselView(imageUrls: viewModel.hotel.imageUrls)
                            Spacer()
                                .frame(height: 16)
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
                                .frame(height: 8)
                            Text(viewModel.hotel.name)
                                .font(AppFonts.medium22)
                                .foregroundColor(AppColors.black.swiftUIColor)
                            Spacer()
                                .frame(height: 8)
                            Button(action: {}) {
                                Text(viewModel.hotel.address)
                                    .multilineTextAlignment(.leading)
                                    .font(AppFonts.medium14)
                                    .foregroundColor(AppColors.blue.swiftUIColor)
                            }
                            Spacer()
                                .frame(height: 16)
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text("от \(formatPrice(viewModel.hotel.minimalPrice)) ₽")
                                    .font(AppFonts.semibold30)
                                    .foregroundColor(AppColors.black.swiftUIColor)
                                    .fixedSize()
                                Text("за тур с перелётом")
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
                        .frame(height: 8)

                    ZStack {
                        AppColors.softGray.swiftUIColor
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Об отеле")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(AppFonts.medium22)
                                .foregroundColor(AppColors.black.swiftUIColor)
                            Spacer()
                                .frame(height: 16)
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
                                .frame(height: 12)
                            Text(viewModel.hotel.aboutTheHotel.description)
                                .font(AppFonts.regular16)
                                .foregroundColor(AppColors.black.swiftUIColor)
                            Spacer()
                                .frame(height: 16)
                            VStack(spacing: 10) {
                                AboutHotelButton(
                                    image: Image(uiImage: AppImages.emojiHappy),
                                    buttonName: "Удобства",
                                    buttonType: "Самое необходимое"
                                )
                                AboutHotelButton(
                                    image: Image(uiImage: AppImages.tickSquare),
                                    buttonName: "Что включено",
                                    buttonType: "Самое необходимое"
                                )
                                AboutHotelButton(
                                    image: Image(uiImage: AppImages.closeSquare),
                                    buttonName: "Что не включено",
                                    buttonType: "Самое необходимое",
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
                        .frame(height: 12)
                    GeneralButton(
                        content: {
                            Text("К выбору номера")
                                .font(AppFonts.medium16)
                        },
                        action: {
                            viewModel.goToRoomScreen()
                        },
                        color: AppColors.white.swiftUIColor,
                        cornerRadius: 15,
                        verticalPadding: 15
                    )
                    .padding()
                    .background(AppColors.white.swiftUIColor)
                }
            }
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }

    // MARK: - Private Methods

    private func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: price)) ?? ""
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
