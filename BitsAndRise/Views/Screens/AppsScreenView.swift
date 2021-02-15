//
//  AppsScreenView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI
import BitriseSDK

struct AppsScreenView: View {
    @EnvironmentObject
    private var networkModel: NetworkModel

    @ObservedObject
    private var viewModel = ViewModel()

    let preview: Bool

    fileprivate init(preview: Bool) {
        self.preview = preview
    }

    init() {
        self.preview = false
    }

    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(alignment: .leading) {
                Text("Apps")
                    .font(.headline)
                SearchBar(searchText: $viewModel.appsSearchText, placeHolder: "")
                    .padding(.top, 8)
                AppsSection(apps: viewModel.filteredApps,
                            totalAppsCount: viewModel.bitriseApps?.paging.totalItemCount ?? 0)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .navigationBarTitle(Text("BitsAndRise"))
        .onAppear {
            if networkModel.bitriseAccessToken == nil, let accessToken = viewModel.testAccessToken {
                networkModel.setBitriseAccessToken(to: accessToken)
            }
            networkModel.bitriseGetApps(preview: preview) { (result: Result<BitriseApps, Error>) in
                viewModel.setBitriseApps(with: result)
            }
        }
    }
}

extension AppsScreenView {
    class ViewModel: ObservableObject {
        @Published var bitriseApps: BitriseApps?
        @Published var appsSearchText = ""

        var filteredApps: [BitriseApps.App] {
            guard let appsData = bitriseApps?.data else { return [] }
            let trimmedSearch = appsSearchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            guard !trimmedSearch.isEmpty else { return appsData }
            return appsData.filter {
                $0.title
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .lowercased()
                    .contains(trimmedSearch)
            }
        }

        var testAccessToken: String? {
            guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
                  let dict = NSDictionary(contentsOfFile: path),
                  let accessToken = dict["bitriseTestingAccessToken"] as? String else { return nil }
            return accessToken
        }

        func setBitriseApps(with result: Result<BitriseApps, Error>) {
            switch result {
            case .failure(let failure):
                print(failure)
                print(failure.localizedDescription)
            case .success(let success):
                DispatchQueue.main.async {
                    withAnimation { [weak self] in
                        self?.bitriseApps = success
                    }
                }
            }
        }
    }
}

struct AppsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AppsScreenView(preview: true)
            .environmentObject(NetworkModel())
    }
}
