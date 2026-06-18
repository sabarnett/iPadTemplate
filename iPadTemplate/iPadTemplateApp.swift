//
// -----------------------------------------
// Original project: iPadTemplate
// Original package: iPadTemplate
// Created on: 06/06/2026 by: Steven Barnett
// Web: http://www.sabarnett.co.uk
// GitHub: https://www.github.com/sabarnett
// -----------------------------------------
// Copyright © 2026 Steven Barnett. All rights reserved.
//

import SwiftUI

@main
struct iPadTemplateApp: App {
    @AppStorage(Constants.displayMode) var displayMode: DisplayMode = .system

    @State private var showLaunch = true
    @State private var sharedState = SharedState()

    var body: some Scene {
        WindowGroup {
            if showLaunch {
                LaunchScreen()
                    .task {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                showLaunch = false
                            }
                        }

                        // While the launch screen is up, initialise the
                        // storage providers for local and iCloud (and any other) files.
                        await sharedState.initialise()
                    }
            } else {
                HomeView()
                    .preferredColorScheme(displayMode.colorScheme)
                    .environment(sharedState)

            }
        }
    }

}
