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

struct GeneralSettingsView: View {
    @AppStorage(Constants.displayMode) private var displayMode = DisplayMode.system
    @AppStorage(Constants.displayLaunchScreen) private var displayLaunchScreen = true
    @AppStorage(Constants.launchScreenDisplayTime) private var launchScreenDisplayTime = 5

    var body: some View {
        Form {
            Picker("Display mode", selection: $displayMode) {
                ForEach(DisplayMode.allCases) { mode in
                    Text(mode.description).tag(mode)
                }
            }

            Toggle(isOn: $displayLaunchScreen, label: {
                Text("Display launch screen")
            })

            Picker("Launch Screen Delay Time (seconds)", selection: $launchScreenDisplayTime) {
                ForEach(2...10, id: \.self) { time in
                    Text("\(time)").tag(time)
                }
            }
        }
    }
}

#Preview {
    GeneralSettingsView()
}
