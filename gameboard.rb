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
        parsed_board[row_num][column_num] = {column => [column_num, row_num]}

        @goal = Point.new(column_num, row_num) if column == :e
        @start = Point.new(column_num, row_num) if column == :b

        column_num = column_num + 1
      end
      row_num = row_num + 1
    end
    return parsed_board
  end
end

