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
9. [Bug Tracker](#bug-tracker)
10. [Credits](#credits)

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
- **Ruby**: Ensure Ruby is installed on your system. You can check by running:
  ```
 
