//
//  BitriseApps.swift
//  
//
//  Created by Kamaal M Farah on 14/02/2021.
//

import Foundation

public struct AppListResponseModel: BitriseMockable, Hashable {
    public let data: [AppListResponseModel.AppResponseItemModel]
    public let paging: AppListResponseModel.PagingResponseModel

    public init(data: [AppListResponseModel.AppResponseItemModel], paging: AppListResponseModel.PagingResponseModel) {
        self.data = data
        self.paging = paging
    }

    public struct AppResponseItemModel: Codable, Hashable {
        public let avatarURL: String?
        public let isDisabled: Bool
        public let isPublic: Bool
        public let owner: AppListResponseModel.AppResponseItemModel.OwnerAccountResponseModel
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

        public struct OwnerAccountResponseModel: Codable, Hashable {
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

    public struct PagingResponseModel: Codable, Hashable {
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

public extension AppListResponseModel {
    static var preview: AppListResponseModel {
        let apps = [
            AppResponseItemModel(avatarURL: "",
                isDisabled: false,
                isPublic: false,
                owner: AppResponseItemModel.OwnerAccountResponseModel(accountType: "account type", name: "Me is the name", slug: "123brt"),
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
                owner: AppResponseItemModel.OwnerAccountResponseModel(accountType: "account type", name: "Me is the name", slug: "123brt"),
                projectType: "android",
                provider: "Bitrise",
                repoOwner: "I am",
                repoSlug: "ewr123",
                repoURL: "https://app.bitrise.io",
                slug: "slg123",
                status: 1,
                title: "The big app")
        ]
        return AppListResponseModel(data: apps, paging: PagingResponseModel(next: "yes", pageItemLimit: 20, totalItemCount: 20))
    }
}
