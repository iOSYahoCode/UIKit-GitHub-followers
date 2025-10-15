//
//  Follower.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 15.10.2025.
//

import Foundation

nonisolated struct Follower: Codable, Hashable, Sendable {
    let login: String
    let avatarUrl: String
}
