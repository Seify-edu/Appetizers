//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Roman Smirnov on 12.07.2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
