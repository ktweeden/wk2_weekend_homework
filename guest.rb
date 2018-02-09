class Guest

  attr_reader :name

  def initialize(name, age, fave_song, wallet)
    @name = name
    @age = age
    @fave_song = fave_song
    @wallet = wallet
    @ability = rand(1...10)
    @tollerance = rand(1...10)
  end

end
