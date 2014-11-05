require 'minitest/autorun'
require_relative '../app/board'

describe Board do

  it 'can be created with default size' do
    board = Board.create_with_default_size
    board.size.must_equal Board::DEFAULT_SIZE
  end

  it 'can be created with custom size' do
    board = Board.create_with_size 10
    board.size.must_equal 10
  end

  it 'can be created with fields' do
    board = Board.new([[:' ', :' '], [:' ', :' ']])
    board.size.must_equal 2
  end

end
