# frozen_string_literal: true

# the introductory text for the game
module Instructions
  def instructions
    <<~HEREDOC



 #{formatting('underline', 'Trapped in a Cabin with Lord Byron')}

A one page RPG by Oliver Darkshire



You are on vacation with Lord Byron in his holiday home, but the weather has trapped you and your friends inside his house. Only the strong will survive.

You have three scores: Scandal, Masterpiece, and Stress.

During your holiday, you will roll two six-sided die (2d6) to generate Byronic Events, which will adjust your scores appropriately. Keep rolling new events until your Scandal, Masterpiece, or Stress reaches 10.

Will you create a new genre of supernatural horror fiction based on your time with Byron? Or will Byron ruin both your reputation and your sanity?

Beware: if you roll three 6s in a row, Byron will destroy your manuscript and Masterpiece will be reduced to zero!

Are you ready to begin your vacation?





    HEREDOC
  end

  def formatting(description, string)
    {
      'underline' => "\e[4;1m#{string}\e[0m"
    }[description]
  end
end
