//
//  EntryContentView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import SwiftUI
import BitriseSDK
import SalmonUI
import ShrimpExtensions

struct EntryContentView: View {
    @ObservedObject
    var viewModel: EntryViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Apps")
                .font(.headline)
            VStack(alignment: .leading) {
                ForEach(viewModel.filteredApps, id: \.self) { (app: BitriseApps.App) in
                    VStack {
                        Divider()
                        HStack {
                            appAvatar(avatarURL: app.avatarURL)
                                .frame(width: 56, height: 56)
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
                }
                Divider()
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func appAvatar(avatarURL: String?) -> some View {
        ZStack {
            Color.accentColor
        }
        .cornerRadius(8)
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

#if DEBUG
struct EntryContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EntryViewModel()
        viewModel.apps = BitriseApps.preview
        viewModel.profile = BitriseProfile.preview
        return NavigationView {
            EntryContentView(viewModel: viewModel)
                .navigationBarTitle(Text("BitsAndRise"))
        }
    }
}
#endif
