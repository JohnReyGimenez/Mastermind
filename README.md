# Mastermind Game

Welcome to Mastermind, a classic code-breaking game where you can either guess a secret code or create one for the computer to guess. This project is implemented in Ruby and uses the `colorize` gem for a colorful terminal experience.

---

## Table of Contents
1. [How to Play](#how-to-play)
2. [Local Setup](#local-setup)
3. [Replit Setup](#replit-setup)
4. [Known Issues](#known-issues)
5. [Optimizations](#optimizations)
6. [Lessons Learned](#lessons-learned)
7. [Running the Game](#running-the-game)
8. [Running Tests](#running-tests)
9. [Credits](#credits)

---

## How to Play

### Roles
- **Code Guesser**: You have 10 attempts to guess the secret code.
- **Code Maker**: Create a secret code, and the computer will try to guess it.

### Feedback Rules
- **Black Peg**: Correct color in the correct position.
- **White Peg**: Correct color but in the wrong position.

### Game Flow
1. Choose your role: `guesser` or `maker`.
2. If you're the **guesser**:
   - Input your guess as 4 numbers (1-6) separated by spaces.
   - Example: `1 2 3 4` represents Red, Blue, Green, Yellow.
3. If you're the **maker**:
   - Input your secret code as 4 numbers (1-6) separated by spaces.
   - Provide feedback for the computer's guess using:
     - `1` for a white peg (correct color, wrong position).
     - `2` for a black peg (correct color and position).
   - Example: `1 1 2 2` means two whites and two blacks.

---

## Local Setup

### Prerequisites
- **Ruby**: Ensure Ruby is installed on your system.
   ```bash
  ruby -v
- **Bundler**: Install Bundler to manage dependencies.
  ```bash
   gem install bundler
---

## Running the Game
To run the game locally, execute the main mastermind file. Follow the on-screen instructions to play.

### Steps
1. Fork the Repository:
   - Go to the [Mastermind[](https://github.com/JohnReyGimenez/Mastermind) repository and click the Fork button to create your own copy of the project.
2. Clone the repository.
   ```bash
   git clone git@github.com:JohnReyGimenez/Mastermind.git
3. Navigate to the project directory.
   ```bash
   cd lib
4. Install dependencies using Bundler.
   ```bash
   bundle install
5. Run the game.
   ```bash
   ruby mastermind.rb

---

## Replit Setup
1. Fork the project on [Replit](https://replit.com/@gimenezjr5/Tic-Tac-Toe?v=1).
2. Click the **Run** button to start the game.
3. Follow the on-screen instructions to play.

---

## Known Issues
UI Alignment in Code Maker Role:

When playing as the code maker, the feedback section of the UI may break or misalign after the computer makes its first guess.
---

## Optimizations
Here are the key optimizations made during development:
- **UI Alignment Fix**:
  - Added logic to calculate the visible width of colored text, ignoring ANSI escape codes.
  - Manually padded strings to ensure consistent alignment.
- **Feedback Handling**:
  - Ensured feedback is always 4 elements long, padding with `nil` if necessary.
  - Improved the `feedback_to_colors` method to handle edge cases.
- **Computer Guesser Logic**:
  - Refactored the `refine_based_on_feedback` method to ensure the computer makes intelligent guesses based on feedback.
  - Added difficulty levels (`easy`, `medium`, `hard`) to control the number of random guesses.
- **Code Duplication Reduction**:
  - Extracted common logic (e.g., `update_guess`, `update_feedback`) into a `GameLogic` module for reuse across classes.
- **Error Handling**:
  - Added input validation for guesses and feedback to prevent crashes.

---

## Lessons Learned
- **ANSI Escape Codes**: Learned how to handle hidden characters added by the `colorize` gem to ensure proper string alignment.
- **UI Design**: Gained experience in designing a clean and user-friendly terminal interface.
- **Refactoring**: Improved code readability and maintainability by reducing duplication and separating concerns.
- **Feedback Logic**: Developed a deeper understanding of how to process and display feedback in a code-breaking game.

---

## Running Tests
This project does not currently include a test suite. However, you can manually test the game by playing through different scenarios (e.g., guessing the code, creating a code for the computer to guess).

---

## Credits
- **Developer**: John Rey G. Gimenez
- **Inspiration**: Classic Mastermind game.
- **Tools**: Ruby, `colorize` gem.

---

Enjoy playing Mastermind! If you have any questions or feedback, feel free to reach out.
