//
//  BuildListAllResponseModel.swift
//  
//
//  Created by Kamaal M Farah on 16/02/2021.
//

import Foundation

public struct BuildListAllResponseModel: BitriseMockable, Hashable {
    public let data: [BuildListAllResponseModel.BuildListAllResponseItemModel]
    public let paging: PagingResponseModel

    public struct BuildListAllResponseItemModel: Codable, Hashable {
        public let abortReason: String?
        public let branch: String
        public let buildNumber: Int
        public let commitHash: String?
        public let commitMessage: String?
        public let commitViewURL: String? // Maybe URL 🤷‍♂️
        public let isOnHold: Bool
        public let machineTypeID: String
        public let originalBuildParams: OriginalBuildParams
        public let pullRequestID: Int
        public let pullRequestTargetBranch: String?
        public let pullRequestViewURL: String? // Maybe URL 🤷‍♂️
        public let repository: AppResponseItemModel
        public let slug: String
        public let stackIdentifier: String
        public let status: Int
        public let statusText: String
        public let tag: String?
        public let triggeredBy: String
        public let triggeredWorkflow: String?

        @DateValueCodable<BitriseDateWithoutMSCodableStrategy> public var environmentPrepareFinishedAt: Date
        @DateValueCodable<BitriseDateWithoutMSCodableStrategy> public var finishedAt: Date
        @DateValueCodable<BitriseDateWithoutMSCodableStrategy> public var triggeredAt: Date

        public enum CodingKeys: String, CodingKey {
            case abortReason = "abort_reason"
            case branch
            case buildNumber = "build_number"
            case commitHash = "commit_hash"
            case commitMessage = "commit_message"
            case commitViewURL = "commit_view_url"
            case environmentPrepareFinishedAt = "environment_prepare_finished_at"
            case finishedAt = "finished_at"
            case isOnHold = "is_on_hold"
            case machineTypeID = "machine_type_id"
            case originalBuildParams = "original_build_params"
            case pullRequestID = "pull_request_id"
            case pullRequestTargetBranch = "pull_request_target_branch"
            case pullRequestViewURL = "pull_request_view_url"
            case repository
            case slug
            case stackIdentifier = "stack_identifier"
            case status
            case statusText = "status_text"
            case tag
            case triggeredAt = "triggered_at"
            case triggeredBy = "triggered_by"
            case triggeredWorkflow
        }

        public struct OriginalBuildParams: Codable, Hashable {
            public let branch: String
        }
    }
}

public extension BuildListAllResponseModel {
    static var preview: BuildListAllResponseModel {
        let builds: [BuildListAllResponseModel.BuildListAllResponseItemModel] = []
        return BuildListAllResponseModel(data: builds, paging: PagingResponseModel(next: nil, pageItemLimit: 20, totalItemCount: 100))
    }
}
