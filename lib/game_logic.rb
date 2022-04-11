require_relative 'game_logic.rb'
require_relative 'instructions.rb'
require_relative 'game_tables.rb'
require 'colorize'

module GameLogic
  def play
    puts instructions
    turns
    game_over_message
  end

  def replay
    turns
    game_over_message
  end

  def turns
    until game_over?
    roll_event
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
    last_three_rolls.push(num)
    last_three_rolls.shift if last_three_rolls.length > 3
    end

    def table_select(num)
    num.between?(1,2) ? GameTables::REC :
    (num.between?(3,4) ? GameTables::DRAMA : GameTables::RESPITE)
    end

    def row_select(first, second)
    table_select(first)[second - 1]
    end

    def disaster?
    last_three_rolls == GameTables::DISASTER
    end

    def byron_strikes
    masterpiece = 0
    puts text('disaster')
    last_three_rolls = Array.new
    end


    def change_values(row)
    row[1].each do |e|
      puts "(#{e[0]} #{e[1]})"
    if e[0] == 'Scandal'
      self.scandal += e[1]
      self.scandal = [self.scandal, 0].max
    elsif e[0] == 'Masterpiece'
      self.masterpiece += e[1]
      self.masterpiece = [self.masterpiece, 0].max
    elsif e[0] == 'Stress'
      self.stress += e[1]
      self.stress = [self.stress, 0].max
    end
    end
    end

    def score_report
    puts
    puts "Scandal: #{scandal}   Masterpiece: #{masterpiece}   Stress: #{stress}".yellow
    puts
    end

    def game_over?
    (scandal >= 10) || (masterpiece >= 10) || (stress >= 10)
    end

    def game_over_message
    scandal >= 10 && masterpiece >= 10 ? (puts text('combo_ending')) :
    scandal >= 10 ? (puts text('scandal')) :
    masterpiece >= 10 ? (puts text('masterpiece')) : (puts [text('stress_one'), text('stress_two')].sample)
    end
end