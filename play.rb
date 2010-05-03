require 'Win32API'
require 'symbol_sort'
require 'point'
require 'player'
require 'gameboard'
require 'consoleboardview'
require 'game'

level1 = {
  :row1 => [ :x, :x, :x, :x, :x],
  :row2 => [ :x, :x, :x, :n, :b],
  :row3 => [ :x, :e, :x, :n, :x],
  :row4 => [ :x, :x, :x, :n, :x],
  :row5 => [ :x, :x, :x, :x, :x]
}

gameboard = GameBoard.new(level1)

player = Player.new(gameboard.start)

cb = ConsoleBoardView.new

game = Game.new
game.play(gameboard, player, cb)
