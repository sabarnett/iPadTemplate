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

  var body: some View {
    List {
      AppearanceSelection()
        .listRowSeparator(.hidden)

      LaunchScreenOptions()
        .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    .navigationTitle("General Settings")
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  GeneralSettingsView()
}
