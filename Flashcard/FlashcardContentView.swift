//
//  FlashcardContentView.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/27/25.
//

import SwiftUI

struct FlashcardContentView: View {
    @State private var cards: [Flashcard] = createGameCards(numberOfPairs: 9)
    @State private var selectedIndices: [Int] = []
    @State private var selectedNumberOfPairs: Int = 9
    @State private var showSizePicker: Bool = false
    @State private var sizeButtonPosition: CGPoint = .zero
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    // Create set of matching cards
    static func createGameCards(numberOfPairs: Int) -> [Flashcard] {
        var cards: [Flashcard] = []
        
        // Ensure we don't exceed available emojis
        let selectedEmojis = Array(Flashcard.emojis.prefix(numberOfPairs))
        
        for emoji in selectedEmojis {
            cards.append(Flashcard(emoji: emoji))
            cards.append(Flashcard(emoji: emoji))
        }
        
        return cards.shuffled()
    }
    
    // Reset game
    private func resetGame() {
        cards = Self.createGameCards(numberOfPairs: selectedNumberOfPairs)
        selectedIndices.removeAll()
        
        // Unhide all matched cards by resetting their state
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
    }
    
    // Choose card
    private func choose(at index: Int) {
        guard !cards[index].isMatched, !cards[index].isFaceUp else { return }
        
        cards[index].isFaceUp = true
        selectedIndices.append(index)
        
        if selectedIndices.count == 2 {
            checkForMatch()
        }
    }

    private func checkForMatch() {
        let firstIndex = selectedIndices[0]
        let secondIndex = selectedIndices[1]
        
        if cards[firstIndex].emoji == cards[secondIndex].emoji {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                cards[firstIndex].isFaceUp = false
                cards[secondIndex].isFaceUp = false
            }
        }
        selectedIndices.removeAll()
    }
    
    var body: some View {
        ZStack {
            VStack {
                navigationBar
                Spacer()
                cardGrid
            }
            
            // Size Picker Dropdown (appears over cards)
            if showSizePicker {
                dropdownOptions
            }
        }
        .navigationTitle("Memory Game")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var dropdownOptions: some View {
        VStack {
            Button("3 Pairs") {
                selectedNumberOfPairs = 3
                resetGame()
                showSizePicker.toggle()
            }
            .padding()
            
            Button("6 Pairs") {
                selectedNumberOfPairs = 6
                resetGame()
                showSizePicker.toggle()
            }
            .padding()
            
            Button("9 Pairs") {
                selectedNumberOfPairs = 9
                resetGame()
                showSizePicker.toggle()
            }
            .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding()
        .position(x: sizeButtonPosition.x + 50, y: sizeButtonPosition.y + 50)
        .offset(x: 27, y: 95)
        .zIndex(1)
    }
    
    // Navigation bar with buttons
    private var navigationBar: some View {
        HStack {
            Button("Choose Size") {
                showSizePicker.toggle()
            }
            .padding()
            .background(.orange)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
            Spacer()
            
            Button("Reset Game") {
                resetGame()
            }
            .padding()
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .zIndex(1)
    }
    
    // Card grid section
    private var cardGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<cards.count, id: \.self) { index in
                    FlashcardView(card: cards[index])
                        .opacity(cards[index].isMatched ? 0 : 1)
                        .onTapGesture {
                            choose(at: index)
                        }
                }
            }
            .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    FlashcardContentView()
}
