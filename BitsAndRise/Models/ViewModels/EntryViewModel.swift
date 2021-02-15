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
    @Published var appsSearchText = ""

    var filteredApps: [BitriseApps.App] {
        guard let appsData = apps?.data else { return [] }
        let trimmedSearch = appsSearchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !trimmedSearch.isEmpty else { return appsData }
        return appsData.filter {
            $0.title
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
                .contains(trimmedSearch)
        }
    }
}
