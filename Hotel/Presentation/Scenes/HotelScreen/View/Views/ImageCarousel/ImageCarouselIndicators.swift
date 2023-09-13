//
//  ImageCarouselIndicators.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import SwiftUI

struct ImageCarouselIndicators: View {

    // MARK: - Public Properties

    @Binding public var currentImageIndex: Int
    public let imageCount: Int

    // MARK: - Body

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<imageCount, id: \.self) { index in
                ZStack {
                    AppColors.white.swiftUIColor
                    RoundedRectangle(cornerRadius: 50)
                        .fill(AppColors.black.swiftUIColor)
                        .frame(width: 7, height: 7)
                        .opacity(calculateAlphaFor(index))
                        .animation(.easeIn(duration: 0.15), value: currentImageIndex)
                }
                .frame(width: 12, height: 12)
                .onTapGesture {
                    currentImageIndex = index
                }
            }
        }
        .padding(.horizontal, 7.5)
        .padding(.vertical, 2.5)
        .background(
            RoundedRectangle(
                cornerRadius: 5
            ).fill(AppColors.white.swiftUIColor)
        )

    }

    private func calculateAlphaFor(
        _ index: Int
    ) -> Double {
        if currentImageIndex == index {
            return 1
        }

        let offsetToCurrentImageIndex = abs(index - currentImageIndex)

        let maxAlpha = 0.25
        let minAlpha = 0.05

        return minAlpha + (maxAlpha - minAlpha) / Double(imageCount) * (Double(imageCount) - Double(offsetToCurrentImageIndex))
    }
}

// MARK: - Preview

struct ImageCarouselIndicators_Previews: PreviewProvider {
    @State static var currentImageIndex: Int = 0
    static var previews: some View {
        ImageCarouselIndicators(
            currentImageIndex: $currentImageIndex,
            imageCount: 10
        )
        .preferredColorScheme(.dark)
    }
}
