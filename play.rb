require 'Win32API'
require 'symbol_sort'
require 'point'
require 'player'
require 'gameboard'
require 'consoleboardview'

level1 = {
  :row1 => [ :x, :x, :x, :x, :x],
  :row2 => [ :x, :x, :x, :n, :b],
  :row3 => [ :x, :e, :x, :n, :x],
  :row4 => [ :x, :x, :x, :n, :x],
  :row5 => [ :x, :x, :x, :x, :x]
}

gameboard = GameBoard.new(level1)

player = Player.new(gameboard.start)

cb = ConsoleBoardView.new(gameboard, player)

def readkey
  (Win32API.new("crtdll", "_getch", [], "L").Call).chr  
end

@complete = false
while @complete == false
  system("cls")
  cb.print_board
  info = readkey
  player.moveleft if info == 'h'
  player.movedown if info == 'j'
  player.moveup if info == 'k'
  player.moveright if info == 'l'
  @complete = true if info == 'q'
end
