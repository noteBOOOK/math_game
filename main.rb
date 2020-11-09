require "./player"
require "./questions"
require "./turns"
require "./game"


def start
  puts "Let's start the game!"

  new_game = Game.new

  new_game.start_game

end

start