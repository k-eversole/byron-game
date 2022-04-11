require_relative 'game_tables.rb'
require_relative 'game_logic.rb'
require_relative 'instructions.rb'
require_relative 'game.rb'

def play_game
    game = Game.new
    game.play
    play_again
  end

def replay_game
    game = Game.new
    game.replay
    play_again
end

def play_again
    puts 'Would you like to play again? Y/N'
    input = gets.chomp
    if input.downcase == 'y'
      replay
    else puts 'Thanks for playing!'
    end
  end

  play_game