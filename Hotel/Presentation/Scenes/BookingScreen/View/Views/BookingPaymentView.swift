//
//  BookingPaymentView.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import SwiftUI

struct BookingPaymentView: View {

    // MARK: - Public Properties

    public var paymentName: String
    public var paymentAmount: Int

    public var paymentDataFont: Font = AppFonts.regular16
    public var paymentDataColor: Color = AppColors.black.swiftUIColor

    // MARK: - Body

    var body: some View {
        HStack {
            Text(paymentName)
                .font(AppFonts.regular16)
                .foregroundColor(AppColors.gray.swiftUIColor)
            Spacer()
            Text("\(paymentAmount.formatToPrice()) ₽")
                .font(paymentDataFont)
                .foregroundColor(paymentDataColor)
        }
    }
}

// MARK: - Preview

struct BookingPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        BookingPaymentView(paymentName: "Тур", paymentAmount: 186000)
    }
}
