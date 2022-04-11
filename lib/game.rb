require_relative 'game_tables.rb'
require_relative 'game_logic.rb'
require_relative 'instructions.rb'

class Game
include GameTables
include Instructions
include GameLogic
attr_accessor :masterpiece, :scandal, :stress, :last_three_rolls

def initialize
  @scandal = 0
  @masterpiece = 0
  @stress = 0
  @last_three_rolls = Array.new
end
end