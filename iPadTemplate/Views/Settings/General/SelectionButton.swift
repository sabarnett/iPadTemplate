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

struct SelectionButton: View {
  let systemImageName: String
  let caption: String
  let isCurrent: Bool

  let onTap: () -> Void

  var body: some View {
    Button(
      action: { onTap() },
      label: {
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
            .fill(
              isCurrent
                ? .blue.opacity(0.4)
                : .gray.opacity(0.25)
            )
            .stroke(
              isCurrent
                ? .blue
                : .gray
            )
        )
      }
    )
    .buttonStyle(.plain)
  }
}
