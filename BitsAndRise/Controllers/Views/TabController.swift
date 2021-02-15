//
//  TabController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers = [
            entryScreen(tag: 0)
        ]
    }

    private func entryScreen(tag: Int) -> UIViewController {
        let viewModel = EntryViewModel()
        let view = EntryContentView(viewModel: viewModel)
        let viewController = EntryViewController(rootView: view)
        viewController.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "rectangle.grid.2x2"), tag: tag)
        return viewController
    }

}
