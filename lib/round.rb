require './lib/card'
require './lib/deck'


class Round
attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def turns
    @turns
  end

  def current_card
    counter = 0
    p deck[counter]
    counter += 1

  end

  def take_turn(guess)
    counter = 0
    current_turn = Turn.new(guess, deck[counter])
    @turns << current_turn if deck[counter] == current_turn
    counter += 1
  end

end
