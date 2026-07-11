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
  @AppStorage(Constants.displayLaunchScreen) private var displayLaunchScreen =
    true
  @AppStorage(Constants.launchScreenDisplayTime) private
    var launchScreenDisplayTime = 5

  @State private var showLaunch = true
  @State private var sharedState = SharedState()

  var body: some Scene {
    WindowGroup {
      if showLaunch {
        Group {
          // If the launch screen u=is enabled, show it
          if displayLaunchScreen {
            LaunchScreen()
              .task {
                DispatchQueue.main.asyncAfter(
                  deadline: .now()
                    + Double(launchScreenDisplayTime)
                ) {
                  withAnimation {
                    showLaunch = false
                  }
                }
              }
          } else {
            // If the launch screen is not enabled, just exit. We cannot
            // use EmptyView() because the .task will not run.
            Text("")
              .task {
                DispatchQueue.main.asyncAfter(
                  deadline: .now() + 0.25
                ) {
                  showLaunch = false
                }
              }
          }
        }
        .task {
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
