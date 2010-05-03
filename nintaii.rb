class Symbol
  def <=>(sym)
    return self.to_s<=>sym.to_s
  end
end

class Player
  attr_accessor :current_location

  def initialize(starting_location)
    @current_location = starting_location
  end
end

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class GameBoard
  attr_accessor :board, :goal, :start

  def initialize(board)
    @board = parse_board(board)
  end

  def parse_board(board)
    row_num = 0
    parsed_board = []
    board.sort.each do |row, columns|
      parsed_board[row_num] = []

      column_num = 0
      columns.each do |column|
        parsed_board[row_num][column_num] = {column => [row_num, column_num]}

        @goal = Point.new(column_num, row_num) if column == :e
        @start = Point.new(column_num, row_num) if column == :b

        column_num = column_num + 1
      end
      row_num = row_num + 1
    end
    return parsed_board
  end
end

class ConsoleBoard
  def initialize(board, player)
    @board = board
    @player = player
    @squares = {:x => "[ ]", :e => "[O]", :b => "[ ]", :p => "[X]", :n => "   "}
  end

  def print_board()
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

level1 = {
  :row1 => [ :x, :x, :x, :x, :x],
  :row2 => [ :x, :x, :x, :n, :b],
  :row3 => [ :x, :e, :x, :n, :x],
  :row4 => [ :x, :x, :x, :n, :x],
  :row5 => [ :x, :x, :x, :x, :x]
}

gameboard = GameBoard.new(level1)

player = Player.new(gameboard.start)

cb = ConsoleBoard.new(gameboard, player)
cb.print_board

