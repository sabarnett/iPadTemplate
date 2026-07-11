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

struct SidebarView: View {
  @Binding var selection: String?
  @State private var listContent = [
    "Item 1",
    "Item 2",
    "Item 3",
  ]

  var body: some View {
    NavigationStack {
      List(selection: $selection) {
        ForEach(listContent, id: \.self) { item in
          Section(item) {
            Text(item)
              .tag(item)
          }
        }
      }
      .listStyle(.plain)
      .navigationTitle("Sidebar")
    }
  }
}

#Preview {
  SidebarView(selection: .constant(nil))
}
