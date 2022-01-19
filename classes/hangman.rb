# frozen_string_literal: true

require './modules/hangman_logic'
require './modules/json_serializer'
require './modules/save_load'
require './resources/messages'

# Hangman class
class Hangman
  include HangmanLogic
  include Messages
  include JsonSerializer
  include SaveLoad

  def initialize
    @current_word = load_words
    @hidden_word = ('_ ' * @current_word.length).strip
    @error_count = 0
  end

  def play
    start_game

    while @error_count < 6 && @hidden_word.include?('_')
      puts COMMON_MESSAGES[:turn]
      guess = gets.chomp.downcase

      @hidden_word, @error_count = check_guess(guess, @current_word, @hidden_word, @error_count)

      check_save if @error_count < 6
    end

    puts @error_count < 6 ? COMMON_MESSAGES[:winner] : COMMON_MESSAGES[:loser]
  end

  private

  def start_game
    puts COMMON_MESSAGES[:welcome]

    puts STATE_MESSAGES[:load?]
    choice = gets.chomp.to_i

    loaded_game = load_game

    deserialize(loaded_game) if choice == 2 && loaded_game != 'ERROR'

    print_state(@hidden_word, @error_count)
  end

  def check_save
    puts STATE_MESSAGES[:save?]
    choice = gets.chomp.to_i

    save_game(serialize) if choice == 2
  end
end
