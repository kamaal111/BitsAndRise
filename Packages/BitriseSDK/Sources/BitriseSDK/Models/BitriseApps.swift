//
//  BitriseApps.swift
//  
//
//  Created by Kamaal M Farah on 14/02/2021.
//

import Foundation

public struct BitriseApps: BitriseMockable, Hashable {
    public let data: [BitriseApps.App]
    public let paging: BitriseApps.Paging

    public init(data: [BitriseApps.App], paging: BitriseApps.Paging) {
        self.data = data
        self.paging = paging
    }

    public struct App: Codable, Hashable {
        public let avatarURL: String?
        public let isDisabled: Bool
        public let isPublic: Bool
        public let owner: BitriseApps.App.Owner
        public let projectType: String?
        public let provider: String?
        public let repoOwner: String
        public let repoSlug: String
        public let repoURL: String?
        public let slug: String
        public let status: Int
        public let title: String

        public enum CodingKeys: String ,CodingKey {
            case avatarURL = "avatar_url"
            case isDisabled = "is_disabled"
            case isPublic = "is_public"
            case owner
            case projectType = "project_type"
            case provider
            case repoOwner = "repo_owner"
            case repoSlug = "repo_slug"
            case repoURL = "repo_url"
            case slug
            case status
            case title
        }

        public struct Owner: Codable, Hashable {
            public let accountType: String
            public let name: String
            public let slug: String

            public enum CodingKeys: String ,CodingKey {
                case accountType = "account_type"
                case name
                case slug
            }
        }
    }

    public struct Paging: Codable, Hashable {
        public let next: String?
        public let pageItemLimit: Int
        public let totalItemCount: Int

        public enum CodingKeys: String ,CodingKey {
            case next
            case pageItemLimit = "page_item_limit"
            case totalItemCount = "total_item_count"
        }
    }
}

public extension BitriseApps {
    static var preview: BitriseApps {
        let apps = [
            App(avatarURL: "",
                isDisabled: false,
                isPublic: false,
                owner: App.Owner(accountType: "account type", name: "Me is the name", slug: "123brt"),
                projectType: "ios",
                provider: "Bitrise",
                repoOwner: "I am",
                repoSlug: "ewr123",
                repoURL: "https://app.bitrise.io",
                slug: "slg123",
                status: 1,
                title: "The app"),
            App(avatarURL: "",
                isDisabled: false,
                isPublic: false,
                owner: App.Owner(accountType: "account type", name: "Me is the name", slug: "123brt"),
                projectType: "android",
                provider: "Bitrise",
                repoOwner: "I am",
                repoSlug: "ewr123",
                repoURL: "https://app.bitrise.io",
                slug: "slg123",
                status: 1,
                title: "The big app")
        ]
        return BitriseApps(data: apps, paging: Paging(next: "yes", pageItemLimit: 20, totalItemCount: 20))
    }
}
