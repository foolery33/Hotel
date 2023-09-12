//
//  BookingDataView.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import SwiftUI

struct BookingDataView: View {

    // MARK: - Public Properties

    public let dataName: String

    public let dataInfo: String

    // MARK: - Body

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(dataName)
                .font(AppFonts.medium16)
                .foregroundColor(AppColors.gray.swiftUIColor)
                .frame(width: UIScreen.main.bounds.width / 2 - 16 - 16 - 30, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
                .frame(width: 16)
            Text(dataInfo)
                .font(AppFonts.medium16)
                .foregroundColor(AppColors.black.swiftUIColor)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
    }
}

// MARK: - Preview

struct BookingDataView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDataView(
            dataName: "Номер",
            dataInfo: "Стандартный с видом на бассейн или сад"
        )
    }
}
