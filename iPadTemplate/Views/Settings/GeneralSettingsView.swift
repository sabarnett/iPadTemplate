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
        List {
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
            .listRowSeparator(.hidden)

            VStack(alignment: .leading, spacing: 12) {
                Text("Launch Screen").font(.title).bold()

                Toggle(isOn: $displayLaunchScreen, label: {
                    Text("Display launch screen")
                })

                Picker("Launch Screen Delay Time (seconds)", selection: $launchScreenDisplayTime) {
                    ForEach(2...10, id: \.self) { time in
                        Text("\(time)").tag(time)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct SelectionButton: View {
    let systemImageName: String
    let caption: String
    let isCurrent: Bool

    let onTap: () -> Void

    var body: some View {
        Button(action: { onTap() }, label: {
            VStack(spacing: 15) {
                Image(systemName: systemImageName)
                    .scaleEffect(1.2)
                Text(caption)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isCurrent
                          ? .blue.opacity(0.4)
                          : .clear)
                    .stroke(.blue)
            )
        })
        .buttonStyle(.plain)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GeneralSettingsView()
}
