//
// -----------------------------------------
// Original project: iPadTemplate
// Original package: iPadTemplate
// Created on: 08/07/2026 by: Steven Barnett
// Web: http://www.sabarnett.co.uk
// GitHub: https://www.github.com/sabarnett
// -----------------------------------------
// Copyright © 2026 Steven Barnett. All rights reserved.
//

import SwiftUI

struct AppearanceSelection: View {

    @AppStorage(Constants.displayMode) private var displayMode = DisplayMode.system

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Appearance").font(.title).bold()
            
            HStack(spacing: 20) {
                SelectionButton(
                    systemImageName: "circle.lefthalf.filled",
                    caption: "System",
                    isCurrent: displayMode == .system
                ) { displayMode = .system }
                
                SelectionButton(
                    systemImageName: "sun.max.fill",
                    caption: "Light",
                    isCurrent: displayMode == .light
                ) { displayMode = .light }
                
                SelectionButton(
                    systemImageName: "moon.stars",
                    caption: "Dark",
                    isCurrent: displayMode == .dark
                ) { displayMode = .dark }
            }
        }
    }
}
