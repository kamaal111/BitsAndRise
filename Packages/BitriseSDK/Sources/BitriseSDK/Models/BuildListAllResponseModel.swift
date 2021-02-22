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
        public let triggeredBy: String?
        public let triggeredWorkflow: String?
        public var environmentPrepareFinishedAt: String? // Maybe Date 🤷‍♂️
        public var finishedAt: String? // Maybe Date 🤷‍♂️
        public var triggeredAt: String? // Maybe Date 🤷‍♂️

        public var hasFinished: Bool {
            finishedAt != nil
        }
    }
}

extension BuildListAllResponseModel.BuildListAllResponseItemModel {
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

#if DEBUG
public extension BuildListAllResponseModel {
    static var preview: BuildListAllResponseModel {
        let json = """
        {
          "data": [
            {
              "triggered_at": "2021-02-20T17:06:45Z",
              "started_on_worker_at": "2021-02-20T17:06:45Z",
              "environment_prepare_finished_at": "2021-02-20T17:06:45Z",
              "finished_at": "2021-02-20T17:14:34Z",
              "slug": "1bb56d8356a5a543",
              "status": 1,
              "status_text": "success",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/readme",
              "build_number": 6079,
              "commit_hash": "e97c81063afff3109747cf34291621d795272182",
              "commit_message": "readme creation\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "e97c81063afff3109747cf34291621d795272182",
                "commit_message": "readme creation\\n",
                "branch": "feature/readme",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/e97c81063afff3109747cf34291621d795272182",
              "repository": {
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
            },
            {
              "triggered_at": "2021-02-20T16:28:40Z",
              "started_on_worker_at": "2021-02-20T16:28:41Z",
              "environment_prepare_finished_at": "2021-02-20T16:28:41Z",
              "finished_at": "2021-02-20T16:37:02Z",
              "slug": "a5c72c0fd8e210d4",
              "status": 1,
              "status_text": "success",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/readme",
              "build_number": 6078,
              "commit_hash": "c9fdbcf4d9df2ee100a25f21e526bde1b10d1766",
              "commit_message": "upgrading gradle and readme\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "c9fdbcf4d9df2ee100a25f21e526bde1b10d1766",
                "commit_message": "upgrading gradle and readme\\n",
                "branch": "feature/readme",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/c9fdbcf4d9df2ee100a25f21e526bde1b10d1766",
              "repository": {
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
            },
            {
              "triggered_at": "2021-02-20T14:22:12Z",
              "started_on_worker_at": "2021-02-20T14:22:13Z",
              "environment_prepare_finished_at": "2021-02-20T14:22:13Z",
              "finished_at": "2021-02-20T14:30:43Z",
              "slug": "ebac40de6da05f0a",
              "status": 1,
              "status_text": "success",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/readme",
              "build_number": 6077,
              "commit_hash": "2f9f26841599229e163665f7e6eaac519260e96e",
              "commit_message": "readme creation\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "2f9f26841599229e163665f7e6eaac519260e96e",
                "commit_message": "readme creation\\n",
                "branch": "feature/readme",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/2f9f26841599229e163665f7e6eaac519260e96e",
              "repository": {
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
            },
            {
              "triggered_at": "2021-02-19T15:34:27Z",
              "started_on_worker_at": "2021-02-19T15:37:36Z",
              "environment_prepare_finished_at": "2021-02-19T15:37:36Z",
              "finished_at": "2021-02-19T15:47:42Z",
              "slug": "42810175059704b8",
              "status": 1,
              "status_text": "success",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/COM-1673-as-an-user-i-would-like-to-go-b",
              "build_number": 6076,
              "commit_hash": "ffc218efaa17f816b232847df18ccad49e477f7a",
              "commit_message": "dasdfdsdaa\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "ffc218efaa17f816b232847df18ccad49e477f7a",
                "commit_message": "Fixing failing tests\\n",
                "branch": "feature/COM-1232dsaffafsafsa",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/ffc218efaa17f816b232847df18ccad49e477f7a",
              "repository": {
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
            },
            {
              "triggered_at": "2021-02-19T15:25:19Z",
              "started_on_worker_at": "2021-02-19T15:29:53Z",
              "environment_prepare_finished_at": "2021-02-19T15:29:53Z",
              "finished_at": "2021-02-19T15:36:59Z",
              "slug": "348970064a36c0db",
              "status": 2,
              "status_text": "error",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/COM-1673-as-an-user-i-would-like-to-go-b",
              "build_number": 6075,
              "commit_hash": "146e033bddd6d3f5e4e994006b659061633fd360",
              "commit_message": "Refactoring loose ends\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "146e033bddd6d3f5e4e994006b659061633fd360",
                "commit_message": "Refactoring loose ends\\n",
                "branch": "feature/COM-12324dasfasfasff",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/146e033bddd6d3f5e4e994006b659061633fd360",
              "repository": {
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
            },
            {
              "triggered_at": "2021-02-19T15:16:47Z",
              "started_on_worker_at": "2021-02-19T15:22:14Z",
              "environment_prepare_finished_at": "2021-02-19T15:22:14Z",
              "finished_at": "2021-02-19T15:28:30Z",
              "slug": "84116c680e1ed042",
              "status": 2,
              "status_text": "error",
              "abort_reason": null,
              "is_on_hold": false,
              "branch": "feature/COM-1673-as-an-user-i-would-like-to-go-b",
              "build_number": 6074,
              "commit_hash": "07b3a7bcb1f39ef63b6516b28e0f9b45e4b21991",
              "commit_message": "fsdfsfafdafage\\n",
              "tag": null,
              "triggered_workflow": "Test-and-analyze",
              "triggered_by": "webhook",
              "machine_type_id": "standard",
              "stack_identifier": "osx-xcode-12.3.x",
              "original_build_params": {
                "commit_hash": "07b3a7bcb1f39ef63b6516b28e0f9b45e4b21991",
                "commit_message": "adFAGFASAGSF\\n",
                "branch": "feature/COM-fasdgerfsEFAFAS",
                "diff_url": "",
                "commit_paths": null
              },
              "pull_request_id": 0,
              "pull_request_target_branch": null,
              "pull_request_view_url": null,
              "commit_view_url": "https://gitprovider.io/company/super-app/commits/07b3a7bcb1f39ef63b6516b28e0f9b45e4b21991",
              "repository": {
                "slug": "4ad7ca251cef3cc7",
                "title": "super-app",
                "project_type": "ios",
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
            }
          ],
          "paging": {
            "total_item_count": 0,
            "page_item_limit": 50,
            "next": "f08a6c150e095d9f"
          }
        }
        """.data(using: .utf8)!
        do {
            return try JSONDecoder().decode(BuildListAllResponseModel.self, from: json)
        } catch {
            fatalError("\(error)")
        }
    }
}
#endif
