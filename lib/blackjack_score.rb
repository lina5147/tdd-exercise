# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10,'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  score = 0

  hand.each do |card|
      case card
      when 2, 3, 4, 5, 6, 7, 8, 9, 10
        score += card
      when "J", "Q", "K"
        score += 10
      end
  end

  return score
end

