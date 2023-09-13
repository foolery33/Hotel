//
//  GeneralNavigationBar.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI

struct GeneralNavigationBar<Content: View>: View {

    // MARK: - Public Properties

    @ViewBuilder public let leftView: Content?

    public let text: String

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                if leftView != nil {
                    leftView
                }
            }
            Text(text)
                .font(AppFonts.medium18)
                .foregroundColor(AppColors.black.swiftUIColor)
                .frame(maxWidth: .infinity, alignment: .center)
                .lineLimit(1)
                .padding(.leading, 40)
                .padding(.trailing, 40)
        }
        .padding(.bottom, 16)
        .padding(.top, 19)
        .padding(.horizontal, 16)
        .background(
            AppColors.white.swiftUIColor
        )
    }
}

struct GeneralNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        GeneralNavigationBar(
            leftView: {
                
            }, text: "aasdasd"
        )
    }
}
