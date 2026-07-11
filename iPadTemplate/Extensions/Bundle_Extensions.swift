//
// -----------------------------------------
// Original project: iPadTemplate
// Original package: iPadTemplate
// Created on: 18/06/2026 by: Steven Barnett
// Web: http://www.sabarnett.co.uk
// GitHub: https://www.github.com/sabarnett
// -----------------------------------------
// Copyright © 2026 Steven Barnett. All rights reserved.
//

import SwiftUI

extension Bundle {
  public var appName: String {
    getInfo("CFBundleName")
  }

  public var copyright: String {
    let copyright = getInfo("NSHumanReadableCopyright")
      .replacing("\\\\n", with: "\n")
    return copyright.isEmpty || copyright == "⚠️"
      ? "Copyright © \(Date.now.formatted(.dateTime.year()))"
      : copyright
  }

  public var appBuild: String {
    getInfo("CFBundleVersion")
  }

  public var appVersionLong: String {
    getInfo("CFBundleShortVersionString")
  }

  fileprivate func getInfo(_ str: String) -> String {
    infoDictionary?[str] as? String ?? "⚠️"
  }

  public var icon: UIImage? {
    if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
      let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
      let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
      let lastIcon = iconFiles.last
    {
      return UIImage(named: lastIcon)
    }
    return nil
  }
}
