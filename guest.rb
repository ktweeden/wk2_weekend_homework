class Guest

  attr_reader :name, :wallet, :ability, :tolerance

  def initialize(name, age, fave_song, wallet)
    @name = name
    @age = age
    @fave_song = fave_song
    @wallet = wallet
    @ability = rand(1...10)
  end

  def pay(amount)
    @wallet -= amount
  end

  def can_afford?(amount)
    amount <= @wallet
  end

  def find_favourite_song(catalogue)
    p 'Wohoo!' if catalogue.find { |song| song.title == @fave_song }
  end

  def assess_singing(singer, song)
    exclamation = 'Amazing, you are great!' if singer.ability >= song.difficulty
    exclamation = 'Oh wow, you suck' if singer.ability < song.difficulty
    p exclamation
  end
end
