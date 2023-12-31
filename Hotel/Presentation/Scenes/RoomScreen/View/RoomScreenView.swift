//
//  RoomScreenView.swift
//  Hotel
//
//  Created by Nikita Usov on 08.09.2023.
//

import SwiftUI

struct RoomScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: RoomScreenViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.white.swiftUIColor
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                GeneralNavigationBar(
                    leftView: {
                        Button(action: {
                            viewModel.goBackToHotelScreen()
                        }, label: {
                            Image(uiImage: AppImages.chevronLeft)
                                .foregroundColor(AppColors.black.swiftUIColor)
                        })
                    },
                    text: viewModel.hotelName
                )
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.roomList) { room in
                                RoomView(
                                    room: room,
                                    onStartBookingScreen: {
                                        viewModel.goToBookingScreen()
                                    }
                                )
                            }
                        }
                        Rectangle()
                            .fill(AppColors.softWhite.swiftUIColor)
                            .frame(height: AppConstants.spacingTiny)
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

struct RoomScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RoomScreenView(
            viewModel: .init(
                dependencies: .init(
                    getRoomUseCase: UseCaseProvider.instance.getRoomUseCase
                )
            )
        )
    }
}
