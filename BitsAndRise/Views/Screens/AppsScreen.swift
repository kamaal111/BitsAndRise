//
//  AppsScreen.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI
import BitriseSDK

struct AppsScreen: View {
    @ObservedObject
    private var viewModel: ViewModel

    fileprivate init(preview: Bool) {
        self.viewModel = ViewModel(preview: preview)
    }

    init() {
        self.viewModel = ViewModel()
    }

    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(alignment: .leading) {
                SearchBar(searchText: $viewModel.appsSearchText, placeHolder: "Search")
                    .padding(.top, 8)
                AppsSection(apps: viewModel.filteredApps,
                            totalAppsCount: viewModel.bitriseApps?.paging.totalItemCount ?? 0)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .navigationBarTitle(Text("Apps"))
        .onAppear(perform: {
            viewModel.getApps()
        })
    }
}

extension AppsScreen {
    class ViewModel: ObservableObject {

        @Published var bitriseApps: AppListResponseModel?
        @Published var appsSearchText = ""

        let preview: Bool

        private let networker = NetworkController.shared

        fileprivate init(preview: Bool) {
            self.preview = preview
        }

        init() {
            self.preview = false
        }

        var filteredApps: [AppResponseItemModel] {
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

        func getApps() {
            guard bitriseApps == nil else { return }

            if networker.bitriseAccessToken == nil, let accessToken = testAccessToken {
                networker.setBitriseAccessToken(to: accessToken)
            }
            networker.bitriseGetApps(preview: preview) { (result: Result<AppListResponseModel, Error>) in
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
}

struct AppsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppsScreen(preview: true)
        }
    }
}
