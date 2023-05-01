class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    roll_index = 0
# score calculates and returns the total score of the game by iterating over 10 frames
# and calculating the score for each frame using the strike?, spare?, strike_bonus, spare_bonus, 
# and sum_of_pins_in_frame 

    10.times do
      if strike?(roll_index)
        total_score += 10 + strike_bonus(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        total_score += 10 + spare_bonus(roll_index)
        roll_index += 2
      else
        total_score += sum_of_pins_in_frame(roll_index)
        roll_index += 2
      end
    end

    total_score
  end

  private

  def strike?(roll_index)
    @rolls[roll_index] == 10
  end
# strike? checks if a strike was rolled in a given frame by checking if the
# number of pins knocked down on the first roll is 10.

  def spare?(roll_index)
    sum_of_pins_in_frame(roll_index) == 10
  end
# spare? checks if a spare was rolled in a given frame by checking
# if the sum of the number of pins knocked down on the two rolls is 10.

  def strike_bonus(roll_index)
    @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end
# strike_bonus calculates the bonus for a strike by adding the number of pins knocked down on the next two rolls.

  def spare_bonus(roll_index)
    @rolls[roll_index + 2]
  end
# spare_bonus calculates the bonus for a spare by adding the number of pins knocked down on the next roll.

  def sum_of_pins_in_frame(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end
# sum_of_pins_in_frame calculates the sum of the number of pins knocked down on the two rolls in a frame.

end