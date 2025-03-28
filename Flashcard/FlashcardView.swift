//
//  FlashcardView.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/27/25.
//

import SwiftUI

struct FlashcardView: View {
    @State private var isShowingEmoji = false
    let card: Flashcard

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(card.isFaceUp ? Color.blue.gradient : Color.indigo.gradient)

            if card.isFaceUp || card.isMatched {
                Text(card.emoji)
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding()
            }
        }
        .frame(width: 125, height: 175)
    }
}

#Preview {
    FlashcardView(card: Flashcard(emoji: "💜"))
}
