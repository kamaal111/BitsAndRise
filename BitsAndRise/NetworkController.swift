//
//  NetworkController.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import BitriseSDK

public class NetworkController {

    private(set) var bitriseAccessToken: String?

    private let bitrise = BitriseSDK()

    public init() { }

    public func setBitriseAccessToken(to accessToken: String) {
        bitriseAccessToken = accessToken
    }

    public func bitriseGetMe(completion: @escaping (Result<BitriseProfile, Error>) -> Void) {
        bitrise.getMe(accessToken: bitriseAccessToken!, completion: completion)
    }

}
