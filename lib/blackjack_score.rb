# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10,'Jack', 'Queen', 'King', 'Ace']


def aces_points(hand, current_score)

  number_of_aces = hand.count("Ace")

  if number_of_aces == 1 && current_score <= 10
    aces_score = 11
  elsif number_of_aces == 2 && current_score <= 9
    aces_score = 12
  elsif number_of_aces == 3 && current_score <= 8
    aces_score = 13
  elsif number_of_aces == 4 && current_score <= 7
    aces_score = 14
  else
    aces_score = number_of_aces
  end

  return aces_score
end

def blackjack_score(hand)

  score = 0
  hand.each do |card|
      case card
      when 2, 3, 4, 5, 6, 7, 8, 9, 10
        score += card
      when "Jack", "Queen", "King"
        score += 10
      end
  end

  aces_score = aces_points(hand, score)

  return score + aces_score
end

p blackjack_score([10, 2, "Ace", "Ace", "Ace", "Ace"])