//
//  BookingScreenView.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI

struct BookingScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: BookingScreenViewModel

    // MARK: - Body

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Preview

struct BookingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BookingScreenView(
            viewModel: BookingScreenViewModel(
                dependencies: .init()
            )
        )
    }
}
