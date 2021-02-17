//
//  PagingResponseModel.swift
//  
//
//  Created by Kamaal M Farah on 16/02/2021.
//

import Foundation

public struct PagingResponseModel: Codable, Hashable {
    public let next: String?
    public let pageItemLimit: Int
    public let totalItemCount: Int

    public enum CodingKeys: String, CodingKey {
        case next
        case pageItemLimit = "page_item_limit"
        case totalItemCount = "total_item_count"
    }
}
