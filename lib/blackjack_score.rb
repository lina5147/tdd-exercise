# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10,'Jack', 'Queen', 'King', 'Ace']

# calculates the scoring for hands that have one or more aces
# different cases for scoring an ace as an 11 or 1
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
  # argument error for hands with more than 5 cards and less than 2 cards
  if hand.length > 5
    raise ArgumentError.new("Too many cards in your hand!")
  elsif hand.length < 2
    raise ArgumentError.new("Not enough cards! Pick up more!")
  end

  score = 0

  # iterates through each card in the hand adds the points to the total score
  hand.each do |card|
    # argument error for invalid card(s) in hand
    raise ArgumentError.new("Invalid card(s) in your hand!") if !VALID_CARDS.any? (card)

    case card
    when 2, 3, 4, 5, 6, 7, 8, 9, 10
      score += card
    when "Jack", "Queen", "King"
      score += 10
    end
  end

  # invoke aces method and adds to the total score if the hand has aces
  aces_score = aces_points(hand, score)
  score += aces_score

  # argument error if score is greater than 21
  raise ArgumentError.new("Uh oh, that's a bust!") if score > 21

  return score
end


