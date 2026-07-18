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

      // There is a launch screen that gets displayed for an amount of
      // time when it starts. The length of time is variable and can be
      // controlled by the useer. If they elect not to display the launch
      // screen at all, the global state is still initialised but we do not
      // show the launch screen. There is a slight delay of 0.25 seconds
      // before we assume initialisation is complete and go on to display
      // the home screen.
      Toggle(
        isOn: $displayLaunchScreen,
        label: {
          Text("Display launch screen")
        }
      )

      // We can delay startup of the app by between 2 and 10 seconds. This
      // gives the user time to look at our lovely launch screen and gives
      // the app time to initialise it's state. We also give the user the
      // option of ASAP which will hide the launch screen as soon as the
      // global state has been initialised. This introduces the minimum
      // amount of wait time while allowing the app to properly initialise.
      Picker(
        "Launch Screen Delay Time (seconds)",
        selection: $launchScreenDisplayTime
      ) {
        Text("ASAP").tag(0)
        ForEach(2...10, id: \.self) { time in
          Text("\(time)").tag(time)
        }
      }
    }
  }
}
