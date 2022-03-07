class Player 
  attr_reader :name, :lives

  def initialize (name)
    @name = name
    self.lives = 3
  end

  def lose_life
    # lives--
    self.lives -= 1
  end

  private

  attr_writer :lives

end


