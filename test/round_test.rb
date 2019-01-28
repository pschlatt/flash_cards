require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1,card_2,card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
    assert_instance_of Deck, round.deck
  end

  def test_turn_exists_and_is_nil
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1,card_2,card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [], round.turns
  end


def test_current_card
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1,card_2,card_3]

  deck = Deck.new(cards)
  round = Round.new(deck)


  assert_equal card_1, round.current_card

end

  def test_takes_turn

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1,card_2,card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = Turn.new("Juneau", card_1)

    take_a_turn = round.take_turn(card_1.answer)

    assert_instance_of Turn, new_turn
    assert_equal round.turns[0], take_a_turn

   end


   def test_number_of_all_questions_correct_guesses
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       cards = [card_1,card_2,card_3]

       deck = Deck.new(cards)
       round = Round.new(deck)

       round.take_turn(card_1.answer)
       assert_equal 1, round.number_correct
       round.take_turn("Doo Doo Planet")
       assert_equal 1, round.number_correct
       round.take_turn(card_3.answer)
       assert_equal 2, round.number_correct
     end

     def test_correct_guess_by_category_number
   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
   deck = Deck.new([card_1, card_2, card_3])
   round = Round.new(deck)

   round.take_turn(card_1.answer)
   assert_equal 1, round.number_correct_by_category(:Geography)
   round.take_turn("Doo doo Planet")
   assert_equal 0, round.number_correct_by_category(:STEM)
   round.take_turn(card_3.answer)
   assert_equal 1, round.number_correct_by_category(:STEM)
 end

 def test_correct_guess
   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
   deck = Deck.new([card_1, card_2, card_3])
   round = Round.new(deck)

   round.take_turn("Juneau")
   round.turns[0].correct?
   assert_equal 100.0, round.percent_correct
   assert_instance_of Float, round.percent_correct

   round.take_turn("Venus")
   assert_equal 50.0, round.percent_correct
 end

 def test_percentage_of_correct_guesses_for_category
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1,card_2,card_3]


  deck = Deck.new(cards)
  round = Round.new(deck)

  round.take_turn("Juneau")
  round.take_turn("Venus")
  assert_equal 100.0, round.percent_correct_by_category(:Geography)
  assert_instance_of Float, round.percent_correct_by_category(:Geography)
  assert_equal 0, round.percent_correct_by_category(:STEM)
 end

  end
