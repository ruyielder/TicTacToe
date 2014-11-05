class IndexValidator

  def initialize(board)
    @board = board
    max_index = board.size * board.size - 1
    @all_indexes = (0..max_index)
  end

  def is_valid?(index)
    @all_indexes.include?(index) && @board.free?(index)
  end

end