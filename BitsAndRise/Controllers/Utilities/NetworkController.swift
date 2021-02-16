//
//  NetworkController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import BitriseSDK
import Combine

final public class NetworkController {

    private(set) var bitriseAccessToken: String?

    private let bitrise = BitriseSDK(kowalskiAnalysis: false)

    private init() { }

    public static let shared = NetworkController()

    public enum Errors: Error {
        case notAuthorized

        var errorDescription: String? {
            switch self {
            case .notAuthorized:
                return "User not authorized"
            }
        }
    }

    public func setBitriseAccessToken(to accessToken: String) {
        bitriseAccessToken = accessToken
    }

    public func bitriseGetMe(preview: Bool = false, completion: @escaping (Result<UserProfileRespModel, Error>) -> Void) {
        guard let bitriseAccessToken = bitriseAccessToken else {
            completion(.failure(NetworkController.Errors.notAuthorized))
            return
        }
        bitrise.getMe(preview: preview, accessToken: bitriseAccessToken, completion: completion)
    }

    public func bitriseGetApps(preview: Bool = false, completion: @escaping (Result<AppListResponseModel, Error>) -> Void) {
        guard let bitriseAccessToken = bitriseAccessToken else {
            completion(.failure(NetworkController.Errors.notAuthorized))
            return
        }
        bitrise.getApps(preview: preview, accessToken: bitriseAccessToken, completion: completion)
    }

    public func bitriseGetBuilds(preview: Bool = false, completion: @escaping (Result<BuildListAllResponseModel, Error>) -> Void) {
        guard let bitriseAccessToken = bitriseAccessToken else {
            completion(.failure(NetworkController.Errors.notAuthorized))
            return
        }
        bitrise.getBuilds(preview: preview, accessToken: bitriseAccessToken, completion: completion)
    }

}
