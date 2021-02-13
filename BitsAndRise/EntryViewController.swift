//
//  EntryViewController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import UIKit
import SwiftUI

class EntryViewController: UIHostingController<EntryContentView> {

    let networker = NetworkController()

    override init(rootView: EntryContentView) {
        super.init(rootView: rootView)
    }

    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = .systemBackground
        self.title = "BitsAndRise"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        if networker.bitriseAccessToken == nil {
            if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
               let dict = NSDictionary(contentsOfFile: path) {
                if let accessToken = dict["bitriseTestingAccessToken"] as? String {
                    networker.setBitriseAccessToken(to: accessToken)
                }
            }
        }

        guard networker.bitriseAccessToken != nil else { return }

        networker.bitriseGetMe() { completion in
            print(completion)
        }
    }

}

struct EntryContentView: View {
    var body: some View {
        Text("Hello world!")
    }
}
