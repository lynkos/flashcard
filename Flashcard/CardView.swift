//
//  CardView.swift
//  Flashcard
//
//  Created by Kiran Brahmatewari on 3/26/25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var onSwipedLeft: (() -> Void)? // <-- Add closures to be called when user swipes left or right
    var onSwipedRight: (() -> Void)?
    
    @State private var isShowingQuestion = true
    
    // State property to store the offset
    @State private var offset: CGSize = .zero
    
    private let swipeThreshold: Double = 200 // Define a swipeThreshold constant top level
    
    var body: some View {
        ZStack {
            // Card background
            ZStack {
                // Back-most card background
                RoundedRectangle(cornerRadius: 25.0) // <-- Add another card background behind the original
                    .fill(offset.width < 0 ? .red : .green) // <-- Set fill based on offset (swipe left vs right)
                
                // Front-most card background (i.e. original background)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(isShowingQuestion ? Color.blue.gradient : Color.indigo.gradient)
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .opacity(1 - abs(offset.width) / swipeThreshold) // <-- Fade out front-most background as user swipes
            }
            
            VStack(spacing: 20) {
                // Card type (question vs answer)
                Text(isShowingQuestion ? "Question" : "Answer")
                    .bold()
                
                // Separator
                Rectangle()
                    .frame(height: 1)
                
                // Card text
                Text(isShowingQuestion ? card.question : card.answer)
                    .font(.title) // .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding()
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .opacity(3 - abs(offset.width) / swipeThreshold * 3) // <-- Fade the card out as user swipes, beginning fade in the last 1/3 to the threshold
        .rotationEffect(.degrees(offset.width / 20.0)) // <-- Add rotation when swiping
        .offset(CGSize(width: offset.width, height: 0)) // Set the offset of the card view
        .gesture(DragGesture()
            .onChanged { gesture in // <-- onChanged called for every gesture value change, like when the drag translation changes
                let translation = gesture.translation // <-- Get the current translation value of the gesture. (CGSize with width and height)
                print(translation) // <-- Print the translation value
                offset = translation // <-- update the state offset property as the gesture translation changes
            }.onEnded { gesture in  // <-- onEnded called when gesture ends
                
                if gesture.translation.width > swipeThreshold { // <-- Compare the gesture ended translation value to the swipeThreshold
                    print("👉 Swiped right")
                    onSwipedRight?() // <-- Call swiped right closure
                } else if gesture.translation.width < -swipeThreshold {
                    print("👈 Swiped left")
                    onSwipedLeft?() // <-- Call swiped left closure
                } else {
                    print("🚫 Swipe canceled")
                    withAnimation(.bouncy) { // <-- Make updates to state managed property with animation
                        offset = .zero
                    }
                }
            }
        )
        .frame(width: 300, height: 500)
        .onTapGesture {
            isShowingQuestion.toggle()
        }
    }
}

#Preview {
    CardView(card: Card(
        question: "Located at the southern end of Puget Sound, what is the capitol of Washington?",
        answer: "Olympia"))
}
