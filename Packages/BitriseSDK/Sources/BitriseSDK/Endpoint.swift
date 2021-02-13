//
//  Endpoint.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.bitrise.io"
        components.path = "/v0.1/" + path
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        guard let url = components.url else {
            fatalError("Invalid URL components: \(components)")
        }

        return url
    }
}

extension Endpoint {
    static var me: Self {
        Endpoint(path: "me")
    }
}

extension URLRequest {
    init(endpoint: Endpoint) {
        self.init(url: endpoint.url)
    }
}
