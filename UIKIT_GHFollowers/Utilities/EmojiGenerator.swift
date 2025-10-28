//
//  EmojiGenerator.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslav Homziak on 28.10.2025.
//

import Foundation
class EmojiGenerator {
    
    static let shared = EmojiGenerator()
    private init() {}
    
    func getRandomEmoji() -> String {
        let randomEmojiCode = Int.random(in: 0x1F600...0x1F64F)
        if let scalar = UnicodeScalar(randomEmojiCode) {
            return String(scalar)
        }
        return "😎"
    }
}
