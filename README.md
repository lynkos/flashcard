# Project 4 - *Flashcard*
iOS app that allows users to play a simple memory game.

## Features
- [x] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards should be visible.
  - Cards are facedown to indicate the start of the game.
- [x] Users can tap cards to toggle their display between the back and the face: 
  - Tapping on a facedown card should flip it to reveal the front.
  - Tapping a second card that is not identical should flip both back down
- [x] When two matching cards are found, they both disappear from view:
  - Implement logic to check if two tapped cards match.
  - If they match, both cards should either disappear.
  - If they don't match, they should return to the facedown position.
- [x] User can reset the game and start a new game via a button:
  - Include a button that allows users to reset the game.
  - This button should shuffle the cards and reset any game-related state.
- [x] User can select number of pairs to play with (at least 2 unique values like 2 and 4).
- [x] App allows for user to scroll to see pairs out of view.
- [x] Add any flavor you’d like to your UI with colored buttons or backgrounds, unique cards, etc. 
  * Enhance the visual appeal of the app with colored buttons, backgrounds, or unique card designs.
  * Consider using animations or transitions to make the user experience more engaging.

## Demo
<div>
    <a href="https://www.loom.com/share/bebc2939603e4229b1ad5699ac721580">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/bebc2939603e4229b1ad5699ac721580-f7b1ea5e9fe46315-full-play.gif">
    </a>
  </div>
  
## License
    Copyright 2025 Kiran Brahmatewari

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
