//
// -----------------------------------------
// Original project: iPadTemplate
// Original package: iPadTemplate
// Created on: 15/06/2026 by: Steven Barnett
// Web: http://www.sabarnett.co.uk
// GitHub: https://www.github.com/sabarnett
// -----------------------------------------
// Copyright © 2026 Steven Barnett. All rights reserved.
//

import SwiftUI

/// Create a toolbar button.
struct ToolbarImageButton: ToolbarContent {

    var placement: ToolbarItemPlacement = .automatic
    var role: ButtonRole = .close
    var systemImage: String
    var disabled: Bool = false
    var onButtonPress: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            if #available(iOS 26.0, *) {
                Button(role: role, action: { onButtonPress() })
                    .glassEffect()
                    .disabled(disabled)
            } else {
                Button(role: role,
                       action: { onButtonPress() },
                       label: { Image(systemName: systemImage).scaleEffect(1.2) }
                )
                .disabled(disabled)
            }
        }
    }
}
