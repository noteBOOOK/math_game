class Player

  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def life_count
    @lives
  end

  def lose_a_life
    @lives -= 1
  end
end

