class Guest

  attr_reader :name, :wallet

  def initialize(name, age, fave_song, wallet)
    @name = name
    @age = age
    @fave_song = fave_song
    @wallet = wallet
    @ability = rand(1...10)
    @tollerance = rand(1...10)
  end

  def pay(amount)
    @wallet -= amount
  end

  def can_afford?(amount)
    return amount <= @wallet
  end
end
