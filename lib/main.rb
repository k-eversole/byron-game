# frozen_string_literal: true

# starts the game and controls end of game

require_relative 'game_tables'
require_relative 'game_logic'
require_relative 'instructions'
require_relative 'game'

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
    replay_game
  else puts 'Thanks for playing!'
  end
end

play_game
