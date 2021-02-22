//
//  UserProfileRespModel.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation

public struct UserProfileRespModel: BitriseMockable, Hashable {
    public let data: UserProfileDataModel

    public struct UserProfileDataModel: Codable, Hashable {
        public let username: String
        public let slug: String
        public let email: String
        public let avatarURL: String? // Maybe URL 🤷‍♂️
        public let hasUsedOrganizationTrial: Bool
        public let dataID: Int
        public let paymentProcessor: String?

        @DateValueCodable<BitriseDateCodableStrategy> public var createdAt: Date
    }
}

public extension UserProfileRespModel.UserProfileDataModel {
    enum CodingKeys: String, CodingKey {
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

#if DEBUG
public extension UserProfileRespModel {
    static var preview: UserProfileRespModel = {
        let json = """
        {
            "data": {
                "username": "Tester",
                "slug": "dd84000079211d2",
                "email": "tester@tester.com",
                "avatar_url": "",
                "created_at": "2020-01-30T15:57:49.196483Z",
                "has_used_organization_trial": false,
                "data_id": 40000,
                "payment_processor": "Stripe"
            }
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(UserProfileRespModel.self, from: json)
    }()
}
#endif
