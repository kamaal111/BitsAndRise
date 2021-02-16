//
//  BuildsScreen.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI
import BitriseSDK

struct BuildsScreen: View {
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
                SearchBar(searchText: $viewModel.buildsSearchText, placeHolder: "Search")
                    .padding(.top, 8)
                ForEach(viewModel.filteredBuilds, id: \.self) { (build: BuildListAllResponseModel.BuildListAllResponseItemModel) in
                    Text(build.repository.title)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .navigationBarTitle(Text("Builds"))
    }
}

extension BuildsScreen {
    final class ViewModel: ObservableObject {

        @Published var buildsSearchText = ""
        @Published var bitriseBuilds: BuildListAllResponseModel?

        private let preview: Bool

        private let networker = NetworkController.shared

        fileprivate init(preview: Bool) {
            self.preview = preview

            getBuilds()
        }

        init() {
            self.preview = false

            getBuilds()
        }

        var filteredBuilds: [BuildListAllResponseModel.BuildListAllResponseItemModel] {
            return bitriseBuilds?.data ?? []
        }

        var testAccessToken: String? {
            guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
                  let dict = NSDictionary(contentsOfFile: path),
                  let accessToken = dict["bitriseTestingAccessToken"] as? String else { return nil }
            return accessToken
        }

        func getBuilds() {
            if networker.bitriseAccessToken == nil, let accessToken = testAccessToken {
                networker.setBitriseAccessToken(to: accessToken)
            }
            networker.bitriseGetBuilds(preview: preview) { (result: Result<BuildListAllResponseModel, Error>) in
                switch result {
                case .failure(let failure):
                    print(failure.localizedDescription)
                    print(failure)
                case .success(let success):
                    print(success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation { [weak self] in
                            self?.bitriseBuilds = success
                        }
                    }
                }
            }

        }
    }
}

struct BuildsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BuildsScreen(preview: true)
        }
    }
}
