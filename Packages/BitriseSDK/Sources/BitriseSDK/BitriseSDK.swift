//
//  BitriseSDK.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import XiphiasNet
import Foundation

public struct BitriseSDK {
    private let kowalskiAnalysis: Bool
    private let networker: XiphiasNetable

    public init(kowalskiAnalysis: Bool = false) {
        self.networker = XiphiasNet(kowalskiAnalysis: kowalskiAnalysis)
        self.kowalskiAnalysis = kowalskiAnalysis
    }

    public func getMe(accessToken: String, completion: @escaping (Result<BitriseProfile, Error>) -> Void) {
        var request = URLRequest(endpoint: .me)
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        networker.request(from: request, completion: completion)
    }
}
