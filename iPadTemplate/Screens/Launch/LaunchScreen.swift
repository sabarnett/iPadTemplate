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

struct LaunchScreen: View {
  var body: some View {
    GeometryReader { proxy in
      if proxy.size.width > proxy.size.height {
        landscapeLayout(size: proxy.size)
      } else {
        portraitLayout(size: proxy.size)
      }
    }
  }

  func landscapeLayout(size: CGSize) -> some View {
    ZStack {
      Image(.launchLandscape)
        .resizable()
        .edgesIgnoringSafeArea(.all)
      HStack {
        VStack {
          Spacer()
          Text(Bundle.main.appName)
            .font(.system(size: 120))
          Text("Version \(Bundle.main.appVersionLong)")
            .font(.system(size: 40))
            .padding(.bottom, size.height / 5)

          Spacer()
          Text("\(Bundle.main.copyright)")
        }
        Spacer()
      }
      .padding(.leading, size.width / 10)
    }
  }

  func portraitLayout(size: CGSize) -> some View {
    ZStack {
      Image(.launchPortrait)
        .resizable()
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()
        Text(Bundle.main.appName)
          .font(.system(size: 120))
        Text("Version \(Bundle.main.appVersionLong)")
          .font(.system(size: 40))
          .padding(.bottom, size.height / 5)

        Text("\(Bundle.main.copyright)")
      }
    }
  }
}

#Preview {
  LaunchScreen()
}
