//
//  GeneralTextField.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import SwiftUI

struct GeneralTextField: View {

    // MARK: - Public Properties

    @Binding public var text: String
    public var textColor: Color? = AppColors.black.swiftUIColor

    public var placeholder: String = ""
    public var placeholderColor: Color = AppColors.grayishBlue.swiftUIColor

    public var withLabel: Bool = false

    public var label: String = ""
    public var labelColor: Color = AppColors.grayishBlue.swiftUIColor

    public var isSecured: Bool = false

    public var font: Font = AppFonts.regular17
    public var labelFont: Font = AppFonts.regular12

    public var isOutlined: Bool = false

    public var cornerRadius: CGFloat = 10

    public var borderColor: Color = AppColors.grayishBlue.swiftUIColor
    public var borderLineWidth: CGFloat = 1

    public var backgroundColor: Color = AppColors.softGray.swiftUIColor

    public var verticalPadding: CGFloat = 16
    public var horizontalPadding: CGFloat = 16

    public var isAutocorrectionDisabled: Bool = false
    public var autocapitalizationMode: TextInputAutocapitalization = .sentences

    public var submitLabel: SubmitLabel = .next
    public var onSubmitAction: () -> Void = {}

    public var onCommitAction: () -> Void = {}

    public var isEmptyError: Bool = true
    @Binding public var isErrorActive: Bool

    // MARK: - Private Properties

    @State private var isSecuredText: Bool = true

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if withLabel {
                Text(label)
                    .font(labelFont)
                    .foregroundColor(labelColor)
                    .padding(.leading, horizontalPadding)
            }
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(placeholderColor)
                        .font(font)
                        .padding(.horizontal, horizontalPadding)
                }
                Group {
                    if isSecured {
                        ZStack(alignment: .trailing) {
                            Button(
                                action: {
                                    isSecuredText.toggle()
                                }, label: {
                                    Image(systemName: isSecuredText ? "eye" : "eye.slash")
                                }
                            )
                            .padding(.trailing, horizontalPadding)
                            Group {
                                if isSecuredText {
                                    SecureField("", text: $text)
                                } else {
                                    TextField(
                                        "",
                                        text: $text
                                    )
                                }
                            }
                            .padding(.leading, horizontalPadding)
                            .padding(.trailing, horizontalPadding * 3)
                        }
                    } else {
                        TextField("", text: $text, onCommit: {
                            onCommitAction()
                        })
                            .padding(.horizontal, horizontalPadding)
                    }
                }
                .foregroundColor(textColor)
                .font(font)
                .submitLabel(submitLabel)
                .onSubmit {
                    onSubmitAction()
                }
                .textInputAutocapitalization(autocapitalizationMode)
                .autocorrectionDisabled(isAutocorrectionDisabled)
            }
        }
        .padding(.vertical, verticalPadding)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        isEmptyError ? text.isEmpty && isErrorActive ?
                        AppColors.error.swiftUIColor : backgroundColor
                        : isErrorActive ? AppColors.error.swiftUIColor : backgroundColor
                    )
                    .foregroundColor(borderColor)
                if isOutlined {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: borderLineWidth)
                        .foregroundColor(borderColor)
                }
            }
        )
    }
}

// MARK: - Preview

struct GeneralTextField_Previews: PreviewProvider {
    @State static var text: String = "adsfadasdfsdasdfasdfasdfsadfasdfasdfasdfasdfasdff"
    @State static var isErrorActive: Bool = true
    static var previews: some View {
        GeneralTextField(
            text: $text,
            label: "Фамилия",
            isSecured: false,
            isErrorActive: $isErrorActive
        )
        .preferredColorScheme(.light)
    }
}
