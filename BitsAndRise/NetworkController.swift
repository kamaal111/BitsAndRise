//
//  NetworkController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import BitriseSDK

public class NetworkController {

    private(set) var bitriseAccessToken: String?

    private let bitrise = BitriseSDK(kowalskiAnalysis: false)

    public init() { }

    public func setBitriseAccessToken(to accessToken: String) {
        bitriseAccessToken = accessToken
    }

    public func bitriseGetMe(preview: Bool = false, completion: @escaping (Result<BitriseProfile, Error>) -> Void) {
        #warning("Safely unwrap bitrise access token and return error if nil")
        bitrise.getMe(preview: preview, accessToken: bitriseAccessToken!, completion: completion)
    }

    public func bitriseGetApps(preview: Bool = false, completion: @escaping (Result<BitriseApps, Error>) -> Void) {
        #warning("Safely unwrap bitrise access token and return error if nil")
        bitrise.getApps(preview: preview, accessToken: bitriseAccessToken!, completion: completion)
    }

}
