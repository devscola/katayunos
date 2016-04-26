module RandomUtil
  def self.shuffle(collection)
    collection.shuffle
  end
end

class Player
  INITIAL_HEALTH = 30
  INITIAL_MANA_SLOTS = 0
  MAXIMUM_MANA_SLOTS = 10
  MANA_SLOT_INCREMENT = 1
  INITIAL_DECK = [0,0,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,7,8]
  INITIAL_HAND_SIZE = 3

  def initialize
    @deck = RandomUtil.shuffle(INITIAL_DECK)
    @hand = initial_hand
    @mana_slots = INITIAL_MANA_SLOTS
  end

  def health
    INITIAL_HEALTH
  end

  def mana_slots
    @mana_slots
  end

  alias mana mana_slots

  def deck
    @deck
  end

  def hand
    @hand
  end

  def new_turn
    increment_mana_slots
  end

  private

  def initial_hand
    @deck.shift(INITIAL_HAND_SIZE)
  end

  def increment_mana_slots
    return if @mana_slots == MAXIMUM_MANA_SLOTS
    @mana_slots += MANA_SLOT_INCREMENT
  end
end

def play_hand(deck, mana)
  return 0 if deck.empty?
  head, *tail = deck

  damage = 0
  damage = head if head <= mana
  damage + play_hand(tail, mana - damage)
end

