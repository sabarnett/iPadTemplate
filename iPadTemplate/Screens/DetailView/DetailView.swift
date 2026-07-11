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

struct DetailView: View {
  @Binding var selection: String?

  var body: some View {
    NavigationStack {
      Text("Detail view for \(selection ?? "none")")
        .navigationTitle(selection ?? "Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          // ToCustomise:  Define your toolbar items here
          ToolbarItem(placement: .cancellationAction) {
            Button(
              action: {
                print("Cancel action")
              },
              label: {
                Image(systemName: "gear")
              }
            )
          }
        }
    }
  }
}

#Preview {
  DetailView(selection: .constant(nil))
}
