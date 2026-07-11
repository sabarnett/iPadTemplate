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

struct LaunchScreenOptions: View {
  @AppStorage(Constants.displayLaunchScreen) private var displayLaunchScreen =
    true
  @AppStorage(Constants.launchScreenDisplayTime) private
    var launchScreenDisplayTime = 5

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Launch Screen").font(.title).bold()

      Toggle(
        isOn: $displayLaunchScreen,
        label: {
          Text("Display launch screen")
        }
      )

      Picker(
        "Launch Screen Delay Time (seconds)",
        selection: $launchScreenDisplayTime
      ) {
        ForEach(2...10, id: \.self) { time in
          Text("\(time)").tag(time)
        }
      }
    }
  }
}
