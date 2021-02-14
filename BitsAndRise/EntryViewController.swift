//
//  EntryViewController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import UIKit
import SwiftUI
import BitriseSDK

class EntryViewController: UIHostingController<EntryContentView> {

    let networker = NetworkController()

    private var preview = false

    fileprivate convenience init(preview: Bool, rootView: EntryContentView) {
        self.init(rootView: rootView)

        self.preview = preview
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupView()

        if networker.bitriseAccessToken == nil {
            if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
               let dict = NSDictionary(contentsOfFile: path) {
                if let accessToken = dict["bitriseTestingAccessToken"] as? String {
                    networker.setBitriseAccessToken(to: accessToken)
                }
            }
        }

        guard networker.bitriseAccessToken != nil else { return }

        networker.bitriseGetMe(preview: preview) { (result: Result<BitriseProfile, Error>) in
            switch result {
            case .failure(let failure):
                print(failure.localizedDescription)
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.rootView.viewModel.profile = success
                }
            }
        }

        networker.bitriseGetApps(preview: preview) { (result: Result<BitriseApps, Error>) in
            switch result {
            case .failure(let failure):
                print(failure.localizedDescription)
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.rootView.viewModel.apps = success
                }
            }
        }
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.title = "BitsAndRise"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}

struct EntryViewController_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = EntryViewModel()
        let rootView = EntryContentView(viewModel: viewModel)
        let viewController = EntryViewController(preview: true, rootView: rootView)
        return UINavigationController(rootViewController: viewController).toSwiftUIView()
    }
}
