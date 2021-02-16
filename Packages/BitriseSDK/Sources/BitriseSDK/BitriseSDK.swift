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

public struct BuildListAllResponseModel: BitriseMockable, Hashable {
    public let data: [BuildListAllResponseModel.BuildListAllResponseItemModel]

    public struct BuildListAllResponseItemModel: Codable, Hashable {
        public let abortReason: String?
        public let branch: String
        public let buildNumber: Int
        public let commitHash: String

        public enum CodingKeys: String, CodingKey {
            case abortReason = "abort_reason"
            case branch
            case buildNumber = "build_number"
            case commitHash = "commit_hash"
        }
    }
}

public extension BuildListAllResponseModel {
    static var preview: BuildListAllResponseModel {
        let builds: [BuildListAllResponseModel.BuildListAllResponseItemModel] = [
//            Build(abortReason: "no reason")
        ]
        return BuildListAllResponseModel(data: builds)
    }
}

public protocol BitriseMockable: Codable {
    static var preview: Self { get }
}
