//
//  UserProfileRespModel.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation

public struct UserProfileRespModel: BitriseMockable, Hashable {
    public let data: UserProfileDataModel

    public enum CodingKeys: String, CodingKey {
        case data
    }

    public struct UserProfileDataModel: Codable, Hashable {
        public let username: String
        public let slug: String
        public let email: String
        public let avatarURL: String?
        public let hasUsedOrganizationTrial: Bool
        public let dataID: Int
        public let paymentProcessor: String?

        @DateValueCodable<BitriseDateCodableStrategy> public var createdAt: Date

        public enum CodingKeys: String, CodingKey {
            case username
            case slug
            case email
            case avatarURL = "avatar_url"
            case createdAt = "created_at"
            case hasUsedOrganizationTrial = "has_used_organization_trial"
            case dataID = "data_id"
            case paymentProcessor = "payment_processor"
        }
    }
}

public extension UserProfileRespModel {
    static var preview: UserProfileRespModel = {
        let date = Date()
        return UserProfileRespModel(data: UserProfileDataModel(username: "Userios",
                                                               slug: "b1234h213",
                                                               email: "userios@email.com",
                                                               avatarURL: "",
                                                               hasUsedOrganizationTrial: false,
                                                               dataID: 123,
                                                               paymentProcessor: "Stripe",
                                                               createdAt: date))
    }()
}
