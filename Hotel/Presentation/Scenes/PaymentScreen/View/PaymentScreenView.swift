//
//  PaymentScreenView.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import SwiftUI

struct PaymentScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: PaymentScreenViewModel

    // MARK: - Body

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                GeneralNavigationBar(leftView: {
                    Button(action: {
                        viewModel.goBackToPaymentScreen()
                    }, label: {
                        Image(uiImage: AppImages.chevronLeft)
                            .foregroundColor(AppColors.black.swiftUIColor)
                    })
                }, text: R.string.localizable.order_is_paid())
                VStack(spacing: 0) {
                    Group {
                        Spacer()
                        Image(uiImage: AppImages.confetti)
                        Spacer()
                            .frame(height: AppConstants.spacingHuge)
                        Text(R.string.localizable.your_order_is_in_work())
                            .font(AppFonts.medium22)
                            .foregroundColor(AppColors.black.swiftUIColor)
                        Spacer()
                            .frame(height: AppConstants.spacingLarge)
                        Text(R.string.localizable.payment_confirmation(String(Int.random(in: 1..<999999))))
                            .font(AppFonts.regular16)
                            .foregroundColor(AppColors.gray.swiftUIColor)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    Divider()
                    GeneralButton(
                        content: {
                            Text(R.string.localizable.super())
                                .font(AppFonts.medium16)
                        },
                        action: {
                            viewModel.goBackToHotelScreen()
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

// MARK: - Preview

struct PaymentScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreenView(
            viewModel: PaymentScreenViewModel()
        )
    }
}
