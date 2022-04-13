# frozen_string_literal: true

require_relative 'instructions'
require_relative 'game_tables'
require 'colorize'

# methods needed to play the game
module GameLogic
  def play
    puts instructions
    turns
    end_game
  end

  def replay
    turns
    end_game
  end

  def turns
    loop do
      roll_event
      break if game_over?
    end
  end

  def roll_event
    puts text('roll_dice').red
    gets
    first_roll = rand(1..6)
    second_roll = rand(1..6)
    puts "Rolls: [#{first_roll}, #{second_roll}]\n\n"
    check_for_disaster(first_roll, second_roll)
    row = row_select(first_roll, second_roll)
    puts byronic_text(row[0])
    change_values(row)
    score_report
  end

  def check_for_disaster(first, second)
    move_rolls(first)
    byron_strikes if disaster?
    move_rolls(second)
    byron_strikes if disaster?
  end

  def move_rolls(num)
    last_three_rolls << num
    last_three_rolls.shift if last_three_rolls.length > 3
  end

  def table_select(num)
    if num.between?(1, 2)
      GameTables::REC
    elsif num.between?(3, 4)
      GameTables::DRAMA
    else GameTables::RESPITE
    end
  end

  def row_select(first, second)
    table_select(first)[second - 1]
  end

  def disaster?
    last_three_rolls == GameTables::DISASTER
  end

  def byron_strikes
    self.masterpiece = 0
    puts text('disaster')
    self.last_three_rolls = []
  end

  def change_values(row)
    row[1].each do |e|
      puts "(#{e[0]} #{e[1]})"
      case e[0]
      when 'Scandal'
        change_scandal(e[1])
      when 'Masterpiece'
        change_masterpiece(e[1])
      when 'Stress'
        change_stress(e[1])
      else puts text('error')
      end
    end
  end

  def change_scandal(change)
    self.scandal += change
    self.scandal = [self.scandal, 0].max
  end

  def change_masterpiece(change)
    self.masterpiece += change
    self.masterpiece = [self.masterpiece, 0].max
  end

  def change_stress(change)
    self.stress += change
    self.stress = [self.stress, 0].max
  end

  def score_report
    puts "\nScandal: #{scandal}   Masterpiece: #{masterpiece}   Stress: #{stress}\n".yellow
  end

  def game_over?
    (scandal >= 10) || (masterpiece >= 10) || (stress >= 10)
  end

  def game_over_message
    if scandal >= 10 && masterpiece >= 10
      puts text('combo_ending').red
    elsif scandal >= 10
      puts text('scandal').red
    elsif masterpiece >= 10
      puts text('masterpiece').red
    else puts [text('stress_one').red, text('stress_two').red].sample
    end
  end

  def end_game
    game_over_message
    puts text('game_over').red
  end
end
