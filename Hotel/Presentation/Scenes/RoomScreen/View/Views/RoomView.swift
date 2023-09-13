//
//  RoomView.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI
import SwiftUIFlowLayout

struct RoomView: View {

    // MARK: - Public Properties

    public var room: RoomDomain

    public var onStartBookingScreen: () -> Void

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(AppColors.softGray.swiftUIColor)
                .frame(height: AppConstants.spacingTiny)

            ZStack {
                Rectangle()
                    .fill(AppColors.softGray.swiftUIColor)
                VStack(alignment: .leading, spacing: 0) {
                    ImageCarouselView(
                        imageUrls: room.imageUrls
                    )
                    Spacer()
                        .frame(height: AppConstants.spacingTiny)
                    Text(room.name)
                        .font(AppFonts.medium22)
                        .foregroundColor(AppColors.black.swiftUIColor)
                    Spacer()
                        .frame(height: AppConstants.spacingTiny)
                    FlowLayout(
                        mode: .scrollable,
                        items: room.peculiarities,
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
                        .frame(height: AppConstants.spacingTiny)
                    Button(action: {

                    }, label: {
                        HStack(spacing: 12) {
                            Text(R.string.localizable.about_room())
                                .font(AppFonts.medium16)
                            Image(uiImage: AppImages.chevronRight)
                                .foregroundColor(AppColors.blue.swiftUIColor)
                        }
                        .foregroundColor(AppColors.blue.swiftUIColor)
                        .padding(.vertical, 5)
                        .padding(.leading, 10)
                        .padding(.trailing, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(
                                    AppColors.blue.swiftUIColor.opacity(0.1)
                                )
                        )
                    })
                    Spacer()
                        .frame(height: AppConstants.spacingMedium)
                    HStack(alignment: .firstTextBaseline, spacing: AppConstants.spacingTiny) {
                        Text("\(room.price.formatToPrice()) ₽")
                            .font(AppFonts.semibold30)
                            .foregroundColor(AppColors.black.swiftUIColor)
                            .fixedSize()
                        Text(room.pricePer)
                            .font(AppFonts.medium16)
                            .foregroundColor(AppColors.gray.swiftUIColor)
                    }
                    Group {
                        Spacer()
                            .frame(height: AppConstants.spacingMedium)
                        GeneralButton(
                            content: {
                                Text(R.string.localizable.choose_room())
                                    .font(AppFonts.medium16)
                            },
                            action: {
                                onStartBookingScreen()
                            },
                            color: AppColors.white.swiftUIColor,
                            cornerRadius: 15,
                            verticalPadding: 15
                        )
                    }

                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(AppColors.white.swiftUIColor)
                )
            }
        }
    }
}

// MARK: - Preview

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(
            room: .init(
                id: 0,
                name: "sdfsdf",
                price: 123123,
                pricePer: "asdasd",
                peculiarities: ["asdasd", "asdd"],
                imageUrls: [
                    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
                    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
                    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
                ]
            )
        ) {
            
        }
    }
}
