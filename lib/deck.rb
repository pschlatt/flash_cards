require './lib/card'
require './lib/turn'

class Deck
attr_reader :cards, :category, :count

def initialize(cards)
  @cards = cards
  @category = []
  @count

end

def cards
  @cards
end

def count
@cards.count
end

def cards_in_category(category)
  card_category_return = cards.find_all do |x|
    category == x.category
  end


end

end
