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

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(.appLogo)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .frame(width: 120, height: 120, alignment: .center)
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(Bundle.main.appName)")
                            .font(.system(size: 40, weight: .bold))
                            .textSelection(.enabled)

                        Text("Ver: \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) ")
                            .font(.system(size: 20, weight: .bold))
                            .textSelection(.enabled)
                    }
                    .foregroundStyle(.primary)
                }
                .padding(24)

                VStack(alignment: .leading, spacing: 8) {
                    LabeledContent("Appliation support from") {
                        Link(Constants.homeAddress,
                             destination: Constants.homeUrl )
                    }

                    LabeledContent("Sound files from") {
                        Link("zapsplat.com",
                             destination: URL(string: "https://www.zapsplat.com")!)
                    }

                    LabeledContent("Home page images supplied by") {
                        Link("pixabay.com",
                             destination: URL(string: "https://pixabay.com")!)
                    }
                }
                .padding([.leading, .trailing], 20)

                Spacer()

                HStack {
                    Spacer()
                    Text(Bundle.main.copyright)
                        .font(.system(size: 12, weight: .thin))
                        .multilineTextAlignment(.center)
                        .padding(.top, 32)
                        .padding(.bottom, 20)
                        .padding(.trailing, 12)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("About Planner")
            .toolbar {
                ToolbarImageButton(placement: .primaryAction,
                                   systemImage: "xmark.app") { dismiss() }
            }
        }
        .frame(minHeight: 360)
    }
}

#Preview {
    AboutView()
}
