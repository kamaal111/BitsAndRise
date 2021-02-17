//
//  AppItemView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 17/02/2021.
//

import SwiftUI
import BitriseSDK

struct AppItemView: View {
    let app: AppResponseItemModel

    var body: some View {
        HStack {
            appAvatar(avatarURL: app.avatarURL)
            providerImage(projectType: app.projectType)
                .padding(.horizontal, 4)
            VStack(alignment: .leading) {
                Text(app.repoOwner)
                    .font(.subheadline)
                Text(app.title)
            }
            Spacer()
            if app.isDisabled {
                Image(systemName: "multiply.circle")
                    .size(.squared(24))
                    .foregroundColor(.red)
            } else {
                Image(systemName: "checkmark.circle")
                    .size(.squared(24))
                    .foregroundColor(.green)
            }
        }
    }

    private func appAvatar(avatarURL: String?) -> some View {
        ZStack {
            Color.accentColor
        }
        .cornerRadius(8)
        .frame(width: 56, height: 56)
    }

    private func providerImage(projectType: String?) -> some View {
        let image: Image
        let size: CGSize
        let maxHeight: CGFloat = 24
        switch projectType {
        case "ios":
            image = Image(systemName: "applelogo")
            size = CGSize(width: 20, height: maxHeight)
        case "android":
            image = Image("AndroidLogo")
            size = CGSize(width: 27, height: maxHeight)
        default:
            image = Image(systemName: "questionmark.circle")
            size = .squared(maxHeight)
        }
        return ZStack {
            image
                .size(size)
        }
        .frame(width: 28, height: maxHeight)
    }
}

struct AppItemView_Previews: PreviewProvider {
    static var previews: some View {
        AppItemView(app: AppListResponseModel.preview.data.first!)
    }
}
