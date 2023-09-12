//
//  TouristInfoView.swift
//  Hotel
//
//  Created by Nikita Usov on 12.09.2023.
//

import SwiftUI

struct TouristInfoView: View {

    // MARK: - Public Properties

    public let touristNumber: Int

    @Binding public var name: String
    @Binding public var surname: String
    @Binding public var dateOfBirth: String
    @Binding public var citizenship: String
    @Binding public var passportNumber: String
    @Binding public var passportExpiration: String
    @Binding public var isErrorActive: Bool

    // MARK: - Private Properties

    @State public var isCollapsed: Bool = false

    @FocusState private var focusField: FocusField?

    var body: some View {
        ZStack {
            AppColors.softGray.swiftUIColor
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 0) {
                    Text("Турист \(touristNumber)")
                        .font(AppFonts.medium22)
                        .foregroundColor(AppColors.black.swiftUIColor)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isCollapsed.toggle()
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(AppColors.blue.swiftUIColor.opacity(0.1))
                                .frame(width: 32, height: 32)
                            Image(uiImage: AppImages.chevronTop)
                                .foregroundColor(AppColors.blue.swiftUIColor)
                                .rotationEffect(Angle.degrees(isCollapsed ? 0 : 180))
                        }
                    })
                }
                .frame(height: 58)
                VStack(spacing: 8) {
                    GeneralTextField(
                        text: $name,
                        withLabel: true,
                        label: "Имя",
                        verticalPadding: 10,
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .surname
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .name)
                    GeneralTextField(
                        text: $surname,
                        withLabel: true,
                        label: "Фамилия",
                        verticalPadding: 10,
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .dateOfBirth
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .surname)
                    GeneralTextField(
                        text: $dateOfBirth,
                        placeholder: "Дата рождения",
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .citizenship
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .dateOfBirth)
                    GeneralTextField(
                        text: $citizenship,
                        placeholder: "Гражданство",
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .passportNumber
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .citizenship)
                    GeneralTextField(
                        text: $passportNumber,
                        placeholder: "Номер загранпаспорта",
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .passportExpiration
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .passportNumber)
                    GeneralTextField(
                        text: $passportExpiration,
                        placeholder: "Срок действия загранпаспорта",
                        submitLabel: .done,
                        onSubmitAction: {
                            focusField = nil
                        },
                        isErrorActive: $isErrorActive
                    )
                    .focused($focusField, equals: .passportExpiration)
                    Spacer()
                        .frame(height: 8)
                }
            }
            .modifier(
                CollapsableViewModifier(isCollapsed: $isCollapsed, collapsedHeight: 58)
            )
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColors.white.swiftUIColor)
            )
        }
    }
}

struct TouristInfoView_Previews: PreviewProvider {
    static let touristNumber: Int = 1
    @State static var name: String = ""
    @State static var surname: String = ""
    @State static var dateOfBirth: String = ""
    @State static var citizenship: String = ""
    @State static var passportNumber: String = ""
    @State static var passportExpiration: String = ""
    @State static var isErrorActive: Bool = true
    static var previews: some View {
        TouristInfoView(
            touristNumber: touristNumber,
            name: $name,
            surname: $surname,
            dateOfBirth: $dateOfBirth,
            citizenship: $citizenship,
            passportNumber: $passportNumber,
            passportExpiration: $passportExpiration,
            isErrorActive: $isErrorActive
        )
    }
}

// MARK: - FocusField

private extension TouristInfoView {
    enum FocusField: Hashable {
        case name
        case surname
        case dateOfBirth
        case citizenship
        case passportNumber
        case passportExpiration
    }
}
