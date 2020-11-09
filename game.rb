require "./player"
require "./questions"
require "./turns"

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @new_game = Turns.new
  end

  def next_turn
    puts "----- Turn Number #{@new_game.current_turn} -----"
    questions = Questions.new
    if @new_game.current_turn % 2 == 0
      current_player = 2
    else
      current_player = 1
    end

    puts "Player #{current_player}: What is #{questions.first_num} + #{questions.second_num}?"
    print "> "
    input = $stdin.gets.chomp.to_i
    if input == questions.answer
      puts "Player #{current_player}: YES! You are correct."
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      puts "Player #{current_player}: Sorry! That is incorrect."
      if current_player == 1
        @player1.lose_a_life
      else
        @player2.lose_a_life
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    @new_game.next_turn
  end

  def start_game
    while @player1.lives > 0 && @player2.lives > 0
      next_turn
    end
    
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.life_count}/3"
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.life_count}/3"
    end
    puts "---- GAME OVER ----"
  end
  
end