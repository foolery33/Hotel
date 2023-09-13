//
//  AboutHotelButton.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import SwiftUI

struct AboutHotelButton: View {

    // MARK: - Public Properties

    public let image: Image
    public let buttonName: String
    public let buttonType: String
    public var withSeparator: Bool = true

    // MARK: - Body

    var body: some View {
        Button(
            action: {}
        ) {
            VStack(spacing: 0) {
                HStack(spacing: AppConstants.spacingSmall) {
                    image
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(buttonName)
                                    .font(AppFonts.medium16)
                                    .foregroundColor(AppColors.coal.swiftUIColor)
                                Text(buttonType)
                                    .font(AppFonts.medium14)
                                    .foregroundColor(AppColors.gray.swiftUIColor)
                            }
                            Spacer()
                            Image(uiImage: AppImages.chevronRight)
                                .foregroundColor(AppColors.coal.swiftUIColor)
                        }
                        if withSeparator {
                            Rectangle()
                                .fill(AppColors.gray.swiftUIColor.opacity(0.15))
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .offset(y: 10)
                        }
                    }
                }
                if withSeparator {
                    Spacer()
                        .frame(height: 10)
                }
            }
        }
    }
}

// MARK: - Preview

struct AboutHotelButton_Previews: PreviewProvider {
    static var previews: some View {
        AboutHotelButton(
            image: Image(uiImage: AppImages.emojiHappy),
            buttonName: "Удобства",
            buttonType: "Самое необходимое"
        )
    }
}
