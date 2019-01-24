class Turn
  attr_accessor :string
                :guess
                :card
                :correct?
                :feedback

def initialize(string, card)
@string = string
@card = card
end

def guess
  card.answer
end

def correct?
  guess == card.answer
  return
end

def card
  card = Card.new
end

def feedback
  if correct?
    return "Correct"
  elsif !correct?
    return "Incorrect"
  end
end

end
