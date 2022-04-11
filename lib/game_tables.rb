require_relative 'game_logic.rb'

module GameTables
  extend GameLogic

  DISASTER = [6, 6, 6].freeze

  REC = [
    ['rec_one', [['Stress', 1]]],
    ['rec_two', [['Masterpiece', -1]]],
    ['rec_three', [['Stress', -1], ['Scandal', 1]]],
    ['rec_four', [['Scandal', 2]]],
    ['rec_five', [['Stress', 1]]],
    ['rec_six', [['Stress', -1], ['Masterpiece', 2]]]
  ].freeze

  DRAMA = [
    ['drama_one', [['Stress', 1]]],
    ['drama_two', [['Stress', 2]]],
    ['drama_three', [['Stress', 5]]],
    ['drama_four', [['Scandal', 1]]],
    ['drama_five', [['Scandal', 2]]],
    ['drama_five', [['Scandal', 3]]]
  ].freeze

  RESPITE = [
    ['brief_one', [['Masterpiece', 1]]],
    ['brief_two', [['Stress', -1]]],
    ['brief_three', [['Scandal', 1]]],
    ['brief_four', [['Scandal', 1], ['Masterpiece', 1]]],
    ['brief_five', [['Masterpiece', -1]]],
    ['brief_six', [['Masterpiece', 1]]]
  ].freeze

  def byronic_text(message)
    {
    'rec_one' => 'Is he aware the walls are exceptionally thin?',
    'rec_two' => 'He\'s made a mess of your desk in the process.',
    'rec_three' => 'May he borrow your husband? Of course.',
    'rec_four' => 'His half-sister is here, and they are far too intimate.',
    'rec_five' => 'You weary of listening to tales of his exploits.',
    'rec_six' => 'He makes an excellent muse on occasion.',
    'drama_one' => 'He needs help reading his fan mail.',
    'drama_two' => 'He\'s brought his pet bear. It is not trained.',
    'drama_three' => 'He wants to read you his poetry.',
    'drama_four' => 'He\'s in the papers. Again. Which means you are too.',
    'drama_five' => 'He broke up with his latest girlfriend/boyfriend.',
    'drama_six' => 'He\'s found a new skull to use as a goblet.',
    'brief_one' => 'Time alone. Blissful time.',
    'brief_two' => 'He\'s busy with a paramour.',
    'brief_three' => 'A walk around the house! Underwear on our heads!',
    'brief_four' => 'He has an excellent supply of contraband substances.',
    'brief_five' => 'Wine! A chest of wine!',
    'brief_six' => 'He passed out in his study.'
  }[message]
  end

  def text(message)
    {
      'roll_dice' => 'Press "Enter" to roll the dice.',
      'scandal' => 'You are no longer fit to enter society and must flee to nurse your reputation.',
      'masterpiece' => 'Success! You have created a new genre of supernatural horror fiction based on your time with Byron.',
      'stress_one' => 'You have lost your patience with the man and killed him in a fit of rage.',
      'stress_two' => 'You have descended into uncontrollable weeping from which you will never emerge.',
      'combo_ending' => 'You have finished your masterpiece just as you prepare to flee to the countryside to nurse your reputation. Society will be forever divided between those who think your work is true brilliance and those who think it should be burned.',
      'game_over' => 'Game Over!',
      'play_again' => 'Would you like to play again?',
      'disaster' => 'Oh no, you have rolled three sixes in a row and disaster strikes! Either by accident or on purpose, Byron destroys your manuscript during one of his episodes. Masterpiece has been reset.'
    }[message]
  end
end
