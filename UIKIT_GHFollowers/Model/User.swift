//
//  User.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 15.10.2025.
//

import Foundation

nonisolated struct User: Codable, Hashable, Sendable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let createdAt: String
    
    let name: String?
    let location: String?
    let bio: String?
    
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
}
