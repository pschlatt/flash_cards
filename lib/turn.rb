require "./lib/card"

class Turn
  attr_reader   :guess, :card

def initialize(guess, card)
@card = card
@guess = guess
end


def correct?
  @guess == card.answer
end

def feedback
  if @guess == card.answer
    return "Correct!"
  elsif @guess != card.answer
    return "Incorrect"
  end
end


end
