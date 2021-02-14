//
//  EntryViewModel.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation
import BitriseSDK

final class EntryViewModel: ObservableObject {
    @Published var profile: BitriseProfile?
    @Published var apps: BitriseApps?
}
