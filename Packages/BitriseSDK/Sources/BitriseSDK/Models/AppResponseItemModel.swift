//
//  AppResponseItemModel.swift
//  
//
//  Created by Kamaal M Farah on 16/02/2021.
//

import Foundation

public struct AppResponseItemModel: Codable, Hashable {
    public let avatarURL: String? // Maybe URL 🤷‍♂️
    public let isDisabled: Bool
    public let isPublic: Bool
    public let owner: AppResponseItemModel.OwnerAccountResponseModel
    public let projectType: String?
    public let provider: String?
    public let repoOwner: String
    public let repoSlug: String
    public let repoURL: String? // Maybe URL 🤷‍♂️
    public let slug: String
    public let status: Int
    public let title: String

    public enum CodingKeys: String, CodingKey {
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
    }
}

extension AppResponseItemModel.OwnerAccountResponseModel {
    public enum CodingKeys: String, CodingKey {
        case accountType = "account_type"
        case name
        case slug
    }
}
