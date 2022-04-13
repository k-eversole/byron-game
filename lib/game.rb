# frozen_string_literal: true

require_relative 'game_tables'
require_relative 'game_logic'
require_relative 'instructions'

# main class that starts the game
class Game
  include GameTables
  include Instructions
  include GameLogic
  attr_accessor :masterpiece, :scandal, :stress, :last_three_rolls

  def initialize
    @scandal = 0
    @masterpiece = 0
    @stress = 0
    @last_three_rolls = []
  end
end
