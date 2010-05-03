class ConsoleBoardView
  def initialize
    @squares = {:x => "[ ]", :e => "[O]", :b => "[ ]", :p => "[X]", :n => "   "}
  end

  def print_board(board, player)
    board.board.each do |row|
      row.each do |column|
        key = column.keys[0]
        x = column[key][0]
        y = column[key][1]
        board_piece = "#{@squares[key]}"
        board_piece = @squares[:p] if player.on_point(x, y)
        print "#{board_piece}"
      end
      print "\n"
    end
  end
end
