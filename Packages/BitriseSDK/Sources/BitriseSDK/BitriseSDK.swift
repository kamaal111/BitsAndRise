//
//  BitriseSDK.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import XiphiasNet
import Foundation
import ShrimpExtensions

public struct BitriseSDK {
    private var jsonDecoder = JSONDecoder()
    private var jsonEncoder = JSONEncoder()

    public let baseUrl = URL(staticString: "https://api.bitrise.io/v0.1")

    private let kowalskiAnalysis: Bool
    private let networker: XiphiasNetable

    public init(kowalskiAnalysis: Bool = false) {
        self.networker = XiphiasNet(kowalskiAnalysis: kowalskiAnalysis)
        self.kowalskiAnalysis = kowalskiAnalysis
    }

    public func getMe(accessToken: String, completion: @escaping (Result<BitriseProfile, Error>) -> Void) {
        var request = URLRequest(url: baseUrl.appendingPathComponent("me"))
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        networker.request(from: request, completion: completion)
    }
}

public struct BitriseProfile: Codable {
    public let data: ProfileData

    public struct ProfileData: Codable {
        public let username: String
        public let slug: String
        public let email: String
        public let avatar_url: String?
        public let created_at: String
        public let has_used_organization_trial: Bool
        public let data_id: Int
        public let payment_processor: String?
    }
}
