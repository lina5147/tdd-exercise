require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    score = blackjack_score(["King", 10])
    expect(score).must_equal 20

    score = blackjack_score(["Jack", 10])
    expect(score).must_equal 20

    score = blackjack_score(["Queen", 10])
    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do

    score = blackjack_score(["Ace", 3])
    expect(score).must_equal 14

    score = blackjack_score(["Ace", 10])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 3, 4])
    expect(score).must_equal 18

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    score = blackjack_score(["Ace", 10, 4])
    expect(score).must_equal 15

    score = blackjack_score(["Ace", 8, 7])
    expect(score).must_equal 16

    score = blackjack_score(["Ace", 5, 6, 5])
    expect(score).must_equal 17

  end

  it 'raises an ArgumentError for invalid number of cards' do

    expect {
      blackjack_score([2, 5, 4, "Ace", "King", 2])
    }.must_raise ArgumentError

    expect {
      blackjack_score([2])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for invalid cards' do

    expect {
      blackjack_score(["cat", 10])
    }.must_raise ArgumentError

    expect {
      blackjack_score([100, 2, 9])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    expect {
      blackjack_score([10, 9, "King"])
    }.must_raise ArgumentError

    expect {
      blackjack_score(["Jack", 8, 10])
    }.must_raise ArgumentError

  end
end
