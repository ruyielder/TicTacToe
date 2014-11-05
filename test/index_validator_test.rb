require 'minitest/autorun'
require_relative '../app/index_validator'

class FakeBoard

  attr_reader :size

  def initialize(free_indexes, size=3)
    @free_indexes = free_indexes
    @size = size
  end

  def free?(index)
    @free_indexes.include?(index)
  end

end


describe IndexValidator do

  it 'can be created with board' do
    board = FakeBoard.new([0, 1])
    IndexValidator.new(board).must_be_instance_of IndexValidator
  end

  it 'can validate correct index' do
    board = FakeBoard.new([0, 1, 3, 6])
    validator = IndexValidator.new(board)
    validator.is_valid?(1).must_equal true
  end

  it 'can validate too high index' do
    board = FakeBoard.new([0, 1, 3, 6])
    validator = IndexValidator.new(board)
    validator.is_valid?(9).must_equal false
  end

  it 'can validate too low index' do
    board = FakeBoard.new([0, 1, 3, 6])
    validator = IndexValidator.new(board)
    validator.is_valid?(-1).must_equal false
  end

  it 'can validate not available index' do
    board = FakeBoard.new([0, 1, 3, 6])
    validator = IndexValidator.new(board)
    validator.is_valid?(2).must_equal false
  end

end
