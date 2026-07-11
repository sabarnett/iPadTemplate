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

struct HomeView: View {

  @State private var hasData = false
  @State private var showAbout = false
  @State private var showSettings = false

  @State private var selection: String?

  var body: some View {
    NavigationSplitView(
      sidebar: {
        SidebarView(selection: $selection)
          .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
              settingsButton
            }
            ToolbarItemGroup(placement: .bottomBar) {
              Spacer()
              aboutButton
            }
          }
      },
      detail: {
        if selection != nil {
          DetailView(selection: $selection)
        } else {
          ContentUnavailableView(
            "No selection",
            systemImage: "list.triangle",
            description: Text(
              "Nothing has been selected for display."
            )
          )

        }
      }
    )
    .sheet(isPresented: $showAbout) {
      AboutView()
        .presentationSizing(
          .form.fitted(horizontal: false, vertical: true)
        )
    }
    .sheet(isPresented: $showSettings) { SettingsView() }
  }

  var settingsButton: some View {
    Button(
      action: {
        showSettings = true
      },
      label: {
        Label(
          title: { Text("Settings") },
          icon: {
            Image(systemName: "gearshape")
          }
        )
      }
    )
    .buttonStyle(.glass)
  }

  var aboutButton: some View {
    Button(
      action: {
        showAbout = true
      },
      label: {
        Label(
          title: { Text("About") },
          icon: {
            Image(systemName: "info")
          }
        )
      }
    )
    .buttonStyle(.glass)
  }
}

#Preview {
  HomeView()
}
