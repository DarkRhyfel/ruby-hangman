# frozen_string_literal: true

# Messages module
module Messages
  COMMON_MESSAGES = {
    welcome: 'Welcome to Hangman on Ruby!',
    turn: "\nMake a guess for your next letter!",
    winner: "\nCongratulations, you won! :D",
    loser: "\nSorry, you lose x_x. Better luck next time."
  }.freeze

  STATE_MESSAGES = {
    save?: "\nEnter '1' if you want to keep playing or '2' if you want to save the game.",
    saving: 'Saving the current game...',
    load?: "Enter '1' if you want to start a new game or '2' if you want to load a previous game.",
    loading: 'Loading previous game...',
    no_save: "You haven't saved a game previously. Starting a new game!\n"
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
