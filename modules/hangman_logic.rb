# frozen_string_literal: true

require './resources/messages'

# Hangman logic module
module HangmanLogic
  include Messages

  def load_words
    File.readlines('./resources/5desk.txt', chomp: true)
        .select { |word| word.length.between?(5, 12) }
        .sample
        .downcase
  end

  def print_state(hidden_word, hangman_state)
    puts "\n#{hidden_word}"
    puts HANGMAN_STATE[hangman_state]
  end

  def check_guess(guess, word, hidden_word, error_count)
    indices = (0...word.length).find_all { |i| word[i] == guess }.map { |index| index * 2 }

    if indices.empty?
      error_count += 1
    else
      hidden_word = hidden_word.chars.map.with_index { |dash, index| indices.include?(index) ? guess : dash }.join
    end

    print_state(hidden_word, error_count)

    [hidden_word, error_count]
  end
end
