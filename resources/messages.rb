# frozen_string_literal: true

# Messages module
module Messages
  COMMON_MESSAGES = {
    welcome: 'Welcome to Hangman on Ruby!',
    turn: "\nMake a guess for your next letter!",
    winner: "\nCongratulations, you won! :D",
    loser: "\nSorry, you lose x_x. Better luck next time."
  }.freeze

  HANGMAN_STATE = [
    '
    +---+
    |   |
        |
        |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
        |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
    |   |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|   |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
   /    |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
   / \  |
        |
  ========='
  ].freeze
end
