//
//  BitriseApps.swift
//  
//
//  Created by Kamaal M Farah on 14/02/2021.
//

import Foundation

public struct AppListResponseModel: BitriseMockable, Hashable {
    public let data: [AppResponseItemModel]
    public let paging: PagingResponseModel

    public init(data: [AppResponseItemModel], paging: PagingResponseModel) {
        self.data = data
        self.paging = paging
    }
}

public extension AppListResponseModel {
    static var preview: AppListResponseModel {
        let json = """
        {
            "data": [
              {
                "slug": "4ad7ca251cef3cc7",
                "title": "super-app",
                "project_type": "react-native",
                "provider": "gitprovider",
                "repo_owner": "company",
                "repo_url": "git@gitprovider.io:company/super-app.git",
                "repo_slug": "super-app",
                "is_disabled": false,
                "status": 1,
                "is_public": false,
                "owner": {
                  "account_type": "organization",
                  "name": "Company",
                  "slug": "066a400014cabd50"
                },
                "avatar_url": null
              }
            ],
            "paging": {
                "total_item_count": 1,
                "page_item_limit": 50
            }
        }
        """.data(using: .utf8)!
        do {
            return try JSONDecoder().decode(AppListResponseModel.self, from: json)
        } catch {
            fatalError("\(error)")
        }
    }
}
