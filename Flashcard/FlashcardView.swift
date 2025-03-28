//
//  MemoryCardView.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/27/25.
//

import SwiftUI

struct MemoryCardView: View {
    @State private var isShowingEmoji = false
    let memoryCard: MemoryCard

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(memoryCard.isFaceUp ? Color.blue.gradient : Color.indigo.gradient)

            if memoryCard.isFaceUp || memoryCard.isMatched {
                Text(memoryCard.emoji)
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding()
            }
        }
        .frame(width: 125, height: 175)
    }
}

#Preview {
    MemoryCardView(memoryCard: MemoryCard(emoji: "💜"))
}
