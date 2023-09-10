//
//  ImageCarouselView.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import SwiftUI
import Kingfisher

struct ImageCarouselView: View {

    // MARK: - Public Properties

    public let imageUrls: [String]

    // MARK: - Private Properties

    @State private var currentImageIndex: Int = 0

    // MARK: - Body

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentImageIndex) {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    withAnimation {
                        KFImage(URL(string: imageUrls[index]))
                            .resizable()
                            .frame(height: 257)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .tag(index)
                    }
                }
            }
            .animation(.easeIn(duration: 1), value: currentImageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: currentImageIndex) { newValue in
                print(newValue)
            }
            VStack(spacing: 0) {
                ImageCarouselIndicators(
                    currentImageIndex: $currentImageIndex,
                    imageCount: imageUrls.count
                )
                Spacer()
                    .frame(height: 8)
            }
        }
        .frame(height: 257)
    }
}

// MARK: - Preview

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView(
            imageUrls: [
                "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
                "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
                "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
            ]
        )
    }
}
