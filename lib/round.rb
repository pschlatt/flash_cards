

class Round
attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)

       new_turns = Turn.new(guess, current_card)
       @turns << new_turns
       @deck.cards.rotate!
      return new_turns
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


  def start


    puts "Welcome! You're playing with #{deck.cards.count} cards"
    puts "-" * 79
    questions = deck.cards.map do |card|
      "This is card number #{deck.cards.index(card)} of #{deck.cards.count}."
      "Question: #{card.question}"
    end

    questions.each do |question|
      puts "This is card number #{turns.count + 1} out of #{deck.cards.count}"
      puts question
      input = gets.chomp.downcase.capitalize
      take_turn(input)
      puts turns.last.feedback

    end

    puts "*** Game over! ***"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct.to_i}%"



    category.each do |card|
    puts "#{card.category.to_s} - #{percent_correct_by_category(card.category).to_i} % correct"
    end
    puts ""
    puts ""
  end

end
