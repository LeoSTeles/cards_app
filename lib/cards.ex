defmodule Cards do
   @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Creates a list of cards, with proper values and suits, for further use into the application
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Takes all the cards created and shuffle
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  This is a function that verify if a determined card is a part of the deck
  """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  @doc """
  Creates a hand of cards based into the number of cards that the user choose

    ## Examples

      iex -> deck = Cards.create_deck
      iex -> {hand, deck} = Cards.deal(deck,1)
      iex -> hand
      ["Ace of Spades"]

  """
  def deal(deck,hand_size) do
    Enum.split(deck,hand_size)
  end

  @doc """
  Saves the deck or the hand to a file in the source folder
  """
  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
 @doc """
 Loads a determined deck or hand coming from a file in the source folder in a variable
 """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end

  end

  @doc """
  Using all the upper functions, creates a shuffled hand with the defined number of cards
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
