//
//  MemoryCard.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/27/25.
//

// MemoryCard data model
struct MemoryCard: Equatable {
    let emoji: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static let emojis = [ "💜", "❤️", "🧡", "💛", "💚", "💙", "💖", "🖤", "💗" ]
}
