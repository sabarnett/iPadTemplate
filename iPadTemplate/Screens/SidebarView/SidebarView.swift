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
    "Section 1": ["Item 1", "Item 2", "Item 3"],
    "Section 2": ["Item 4", "Item 5"],
    "Section 3": ["Item 6", "Item 7", "Item 8"]
  ]

  var body: some View {
    NavigationStack {
      List(selection: $selection) {
        ForEach(listContent.keys.sorted(), id: \.self) { itemKey in
          Section(content: {
            let items = listContent[itemKey] ?? []
            ForEach(items, id: \.self) { item in
              Text(item)
                .tag("\(itemKey) - \(item)")
                .listRowSeparator(.hidden)
            }
          }, header: {
            Text(itemKey).font(.title2).bold()
          }, footer: {
            Text("Helper text for section \(itemKey).")
          })
        }
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Sidebar")
    }
  }
}

#Preview {
  SidebarView(selection: .constant(nil))
}
