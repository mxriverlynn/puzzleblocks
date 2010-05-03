class ConsoleBoardView
  def initialize
    @squares = {:x => "[ ]", :e => "[O]", :b => "[ ]", :p => "[X]", :n => "   "}
  end

  def print_board(board, player)
    @board = board
    @player = player

    @board.board.each do |row|
      row.each do |column|
        key = column.keys[0]
        x = column[key][0]
        y = column[key][1]
        board_piece = "#{@squares[key]}"
        board_piece = @squares[:p] if player_on_piece(x, y)
        print "#{board_piece}"
      end
      print "\n"
    end
  end

  def player_on_piece(row, column)
    return (@player.current_location.x == column) && (@player.current_location.y == row)
  end
end
