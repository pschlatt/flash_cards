require './lib/card'
require './lib/deck'
require './lib/turn'



class Round
attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
       new_turns = []
       new_turns << Turn.new(guess, current_card)
       @turns << new_turns
       @deck.cards.rotate!
      return  new_turns
  end


  def current_card
    deck.cards.first
  end

  def number_correct
   turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.to_f / turns.length) * 100
  end

  def percent_correct_by_category(category)
   turns_in_category = turns.count do |turn|
     turn.card.category == category
   end
   percent = (number_correct_by_category(category).to_f / (turns_in_category)) * 100
  end


end
