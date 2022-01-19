# frozen_string_literal: true

require './modules/hangman_logic'
require './resources/messages'

# Hangman class
class Hangman
  include HangmanLogic
  include Messages

  def initialize
    @current_word = load_words
    @hidden_word = ('_ ' * @current_word.length).strip
    @error_count = 0
  end

  def play
    puts COMMON_MESSAGES[:welcome]

    print_state(@hidden_word, @error_count)

    while @error_count < 6 && @hidden_word.include?('_')
      puts COMMON_MESSAGES[:turn]
      guess = gets.chomp.downcase

      @hidden_word, @error_count = check_guess(guess, @current_word, @hidden_word, @error_count)
    end

    puts @error_count < 6 ? COMMON_MESSAGES[:winner] : COMMON_MESSAGES[:loser]
  end
end
