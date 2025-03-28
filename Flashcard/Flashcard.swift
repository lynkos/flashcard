//
//  Flashcard.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/27/25.
//

// Flashcard data model
struct Flashcard: Equatable {
    let emoji: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static let emojis = [ "💜", "❤️", "🧡", "💛", "💚", "💙", "💖", "🖤", "💗" ]
}
