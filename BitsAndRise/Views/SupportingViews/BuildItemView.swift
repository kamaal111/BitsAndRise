//
//  BuildItemView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 17/02/2021.
//

import SwiftUI
import BitriseSDK

struct BuildItemView: View {
    let build: BuildListAllResponseModel.BuildListAllResponseItemModel

    var body: some View {
        VStack {
            HStack {
                hasFinishedSymbol()
                appAvatar(avatarURL: build.repository.avatarURL)
                VStack(alignment: .leading) {
                    Text(build.repository.repoOwner)
                        .font(.subheadline)
                    Text(build.repository.title)
                    Spacer()
                }
                Spacer()
            }
            HStack {
                Image(systemName: "arrow.triangle.branch")
                    .size(.squared(15))
                Text(build.branch)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
    }

    private func hasFinishedSymbol() -> some View {
        if build.hasFinished {
            return Image(systemName: "checkmark.circle")
                .size(.squared(24))
                .foregroundColor(.green)
        }
        return Image(systemName: "multiply.circle")
            .size(.squared(24))
            .foregroundColor(.red)
    }

    private func appAvatar(avatarURL: String?) -> some View {
        ZStack {
            Color.accentColor
        }
        .cornerRadius(8)
        .frame(width: 56, height: 56)
    }
}

struct BuildItemView_Previews: PreviewProvider {
    static var previews: some View {
        let build = BuildListAllResponseModel.preview.data.first!
        return BuildItemView(build: build)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
