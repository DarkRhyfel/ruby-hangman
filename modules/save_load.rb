# frozen_string_literal: true

require './resources/messages'

# Save Load module
module SaveLoad
  include Messages

  def save_game(data)
    puts STATE_MESSAGES[:saving]
    File.write('./saves/new_save.json', data)
  end

  def load_game
    if File.exist?('./saves/new_save.json')
      puts STATE_MESSAGES[:loading]
      File.read('./saves/new_save.json')
    else
      puts STATE_MESSAGES[:no_save]
      'ERROR'
    end
  end
end
