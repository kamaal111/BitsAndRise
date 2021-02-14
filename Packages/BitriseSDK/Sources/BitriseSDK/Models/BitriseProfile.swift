//
//  BitriseProfile.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation

public struct BitriseProfile: BitriseMockable {
    public let username: String
    public let slug: String
    public let email: String
    public let avatarURL: String?
    public let hasUsedOrganizationTrial: Bool
    public let dataID: Int
    public let paymentProcessor: String?

    @DateValueCodable<BitriseDateCodableStrategy> public var createdAt: Date

    public enum CodingKeys: String, CodingKey {
        case data
    }

    public enum DataCodingKeys: String, CodingKey {
        case username
        case slug
        case email
        case avatarURL = "avatar_url"
        case createdAt = "created_at"
        case hasUsedOrganizationTrial = "has_used_organization_trial"
        case dataID = "data_id"
        case paymentProcessor = "payment_processor"
    }

    public init(username: String,
                slug: String,
                email: String,
                avatarURL: String?,
                hasUsedOrganizationTrial: Bool,
                dataID: Int,
                paymentProcessor: String?,
                createdAt: Date) {
        self.username = username
        self.slug = slug
        self.email = email
        self.avatarURL = avatarURL
        self.hasUsedOrganizationTrial = hasUsedOrganizationTrial
        self.dataID = dataID
        self.paymentProcessor = paymentProcessor
        self.createdAt = createdAt
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContrainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)

        self.username = try dataContrainer.decode(String.self, forKey: .username)
        self.slug = try dataContrainer.decode(String.self, forKey: .slug)
        self.email = try dataContrainer.decode(String.self, forKey: .email)
        self.avatarURL = try dataContrainer.decode(String?.self, forKey: .avatarURL)
        self.hasUsedOrganizationTrial = try dataContrainer.decode(Bool.self, forKey: .hasUsedOrganizationTrial)
        self.dataID = try dataContrainer.decode(Int.self, forKey: .dataID)
        self.paymentProcessor = try dataContrainer.decode(String?.self, forKey: .paymentProcessor)

        let createdAt = try dataContrainer.decode(BitriseDateCodableStrategy.RawValue.self, forKey: .createdAt)
        self.createdAt = try BitriseDateCodableStrategy.decode(createdAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var dataContrainer = container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)

        try dataContrainer.encode(username, forKey: .username)
        try dataContrainer.encode(slug, forKey: .slug)
        try dataContrainer.encode(email, forKey: .email)
        try dataContrainer.encode(avatarURL, forKey: .avatarURL)
        try dataContrainer.encode(hasUsedOrganizationTrial, forKey: .hasUsedOrganizationTrial)
        try dataContrainer.encode(dataID, forKey: .dataID)
        try dataContrainer.encode(paymentProcessor, forKey: .paymentProcessor)
        try dataContrainer.encode(createdAt, forKey: .createdAt)
    }
}

public extension BitriseProfile {
    static var preview: BitriseProfile = {
        let date = Date()
        return BitriseProfile(username: "Userios",
                              slug: "b1234h213",
                              email: "userios@email.com",
                              avatarURL: "",
                              hasUsedOrganizationTrial: false,
                              dataID: 123,
                              paymentProcessor: "Stripe",
                              createdAt: date)
    }()
}
