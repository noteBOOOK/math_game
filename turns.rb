class Turns
  
  def initialize
    @current_turn = 1
  end

  def next_turn
    @current_turn += 1
  end

  def current_turn
    @current_turn
  end
end