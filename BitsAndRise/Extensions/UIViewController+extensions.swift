//
//  UIViewController+extensions.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 14/02/2021.
//

import SwiftUI

extension UIViewController {
    func toSwiftUIView() -> some View {
        Preview(viewController: self)
    }

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    }
}
