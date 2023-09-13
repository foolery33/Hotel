//
//  CollapsableModifier.swift
//  Hotel
//
//  Created by Nikita Usov on 12.09.2023.
//

import SwiftUI

struct CollapsableViewModifier: ViewModifier {

    @Binding var isCollapsed: Bool
    let collapsedHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: height, alignment: .top)
            .clipped()
    }
}

private extension CollapsableViewModifier {

    var height: CGFloat? {
        isCollapsed ? collapsedHeight : nil
    }
}
