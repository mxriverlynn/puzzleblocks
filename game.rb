class Game
  def initialize
    @complete = false
  end

  def readkey
    (Win32API.new("crtdll", "_getch", [], "L").Call).chr  
  end

  def play(board, player, view)
    clear_screen
    view.print_board(board, player)

    while @complete == false
      info = readkey

      player.moveleft if info == 'h'
      player.movedown if info == 'j'
      player.moveup if info == 'k'
      player.moveright if info == 'l'
      
      @complete = true if info == 'q'
      @complete = true if player.current_location == board.goal
      
      clear_screen
      view.print_board(board, player)
    end
  end

  def clear_screen
    system("cls")
  end
end
