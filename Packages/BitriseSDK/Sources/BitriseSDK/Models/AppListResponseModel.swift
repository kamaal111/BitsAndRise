//
//  BitriseApps.swift
//  
//
//  Created by Kamaal M Farah on 14/02/2021.
//

import Foundation

public struct AppListResponseModel: BitriseMockable, Hashable {
    public let data: [AppResponseItemModel]
    public let paging: PagingResponseModel

    public init(data: [AppResponseItemModel], paging: PagingResponseModel) {
        self.data = data
        self.paging = paging
    }
}

public extension AppListResponseModel {
    static var preview: AppListResponseModel {
        let apps = [
            AppResponseItemModel(avatarURL: "",
                isDisabled: false,
                isPublic: false,
                owner: .init(accountType: "account type", name: "Me is the name", slug: "123brt"),
                projectType: "ios",
                provider: "Bitrise",
                repoOwner: "I am",
                repoSlug: "ewr123",
                repoURL: "https://app.bitrise.io",
                slug: "slg123",
                status: 1,
                title: "The app"),
            AppResponseItemModel(avatarURL: "",
                isDisabled: false,
                isPublic: false,
                owner: .init(accountType: "account type", name: "Me is the name", slug: "123brt"),
                projectType: "android",
                provider: "Bitrise",
                repoOwner: "I am",
                repoSlug: "ewr123",
                repoURL: "https://app.bitrise.io",
                slug: "slg123",
                status: 1,
                title: "The big app")
        ]
        return AppListResponseModel(data: apps, paging: .init(next: "yes", pageItemLimit: 20, totalItemCount: 20))
    }
}
