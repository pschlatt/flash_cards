require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

def test_it_exists_turn
  card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  assert_instance_of Turn, turn
  assert_instance_of Card, card
end

def test_for_card
  card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  assert_equal card, turn.card
end


def test_for_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  assert_equal "Juneau", turn.guess
end

def test_for_correct
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn1 = Turn.new("Juneau", card)
  turn2 = Turn.new("Nome", card)
  turn3 = Turn.new("Anchorage", card)

  refute turn2.correct?
  assert turn1.correct?
  refute turn3.correct?
end

def test_for_incorrect_feedback
  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Saturn", card)

  assert_equal "Incorrect", turn.feedback
end

def test_for_feedback
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn1 = Turn.new("Juneau", card)
  turn2 = Turn.new("Nome", card)
  turn3 = Turn.new("Anchorage", card)

  assert_equal "Incorrect", turn2.feedback
  assert_equal "Incorrect", turn3.feedback
  assert_equal "Correct!", turn1.feedback
end

end
