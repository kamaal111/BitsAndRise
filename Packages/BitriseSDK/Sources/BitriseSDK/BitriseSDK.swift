//
//  BitriseSDK.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import XiphiasNet
import Foundation

public struct BitriseSDK {
    private let networker: XiphiasNetable

    public init(kowalskiAnalysis: Bool = false) {
        self.networker = XiphiasNet(kowalskiAnalysis: kowalskiAnalysis)
    }

    public func getMe(preview: Bool = false, accessToken: String, completion: @escaping (Result<UserProfileRespModel, Error>) -> Void) {
        get(preview: preview, endpoint: .me, accessToken: accessToken, completion: completion)
    }

    public func getApps(preview: Bool = false, accessToken: String, completion: @escaping (Result<AppListResponseModel, Error>) -> Void) {
        get(preview: preview, endpoint: .apps, accessToken: accessToken, completion: completion)
    }

    public func getBuilds(preview: Bool = false, accessToken: String, completion: @escaping (Result<BuildListAllResponseModel, Error>) -> Void) {
        get(preview: preview, endpoint: .builds, accessToken: accessToken, completion: completion)
    }

    private func get<T: BitriseMockable>(preview: Bool, endpoint: Endpoint, accessToken: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard !preview else {
            completion(.success(.preview))
            return
        }
        var request = URLRequest(endpoint: endpoint)
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        networker.request(from: request, completion: completion)
    }
}

public protocol BitriseMockable: Codable {
    static var preview: Self { get }
}
