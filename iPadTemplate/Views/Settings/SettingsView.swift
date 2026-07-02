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

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme

    @AppStorage(Constants.displayMode) private var displayMode = DisplayMode.system

    @State private var displayStyle: ColorScheme?

    var body: some View {
        NavigationStack {
            List {
                generalSettingsOption()
            }
            .navigationTitle("Planner Settings")
            .toolbar {
                ToolbarImageButton(placement: .primaryAction,
                                   systemImage: "xmark.app") { dismiss() }
            }
            .preferredColorScheme(displayStyle)
        }
        .onAppear {
            displayStyle = displayMode.colorScheme
        }
        .onChange(of: displayMode) {
            // This is a massive fudge. When we change the color scheme,
            // the app will change but the settings sheet will not. This
            // is almost certainly a bug, but it is one that persists.
            //
            // To work round this, we trap the user changing the display
            // mode and set the preferred color scheme to be either
            // light or dark be the opposite of the current system
            // color scheme. It only affects this view while the
            // view is being displayed.
            if displayMode == .system {
                displayStyle = (colorScheme == .dark) ? .light : .dark
            } else {
                displayStyle = displayMode.colorScheme
            }
        }
    }

    func generalSettingsOption() -> some View {
        NavigationLink(destination: {
            GeneralSettingsView()
        }, label: {
            Label("General", systemImage: "gearshape")
                .padding(.vertical, 4)
                .foregroundStyle(.primary)
        })
    }
}

#Preview {
    SettingsView()
}
