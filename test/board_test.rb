require 'minitest/autorun'
require_relative '../app/board'

class FakeField
  attr_accessor :value

  def initialize(value)
    @value = value
  end

end

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
    board = Board.new(
        [[FakeField.new(:' '), FakeField.new(:' ')],
         [FakeField.new(:' '), FakeField.new(:' ')]
    ])
    board.size.must_equal 2
  end

  it 'can be rendered' do
    board = Board.create_with_default_size
    board.render.must_equal (
      "[0] [1] [2] \n" +
      "[3] [4] [5] \n" +
      "[6] [7] [8] \n"
    ), board.render
  end

  it 'can checks free field' do
    board = Board.new([
       [FakeField.new(:' '), FakeField.new(:' ')],
       [FakeField.new(:'X'), FakeField.new(:'O')]
    ])
    board.free?(0).must_equal true
    board.free?(1).must_equal true
    board.free?(2).must_equal false
    board.free?(3).must_equal false
  end

  it 'allows to take field' do
    board = Board.create_with_default_size
    board.take_field(0, :'X')
    board.free?(0).must_equal false
  end

  it 'can be full filled' do
    board = Board.new([
      [FakeField.new(:'X'), FakeField.new(:'X')],
      [FakeField.new(:'X'), FakeField.new(:'O')]
    ])
    board.is_full_filled?.must_equal true
  end

  it 'can be not full filled' do
    board = Board.new([
      [FakeField.new(:' '), FakeField.new(:'X')],
      [FakeField.new(:'X'), FakeField.new(:'O')]
    ])
    board.is_full_filled?.must_equal false
  end

  it 'can detect top horizonal line' do
    Board.new([
      [FakeField.new(:'X'), FakeField.new(:'X'), FakeField.new(:'X')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect middle horizonal line' do
    Board.new([
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:'X'), FakeField.new(:'X'), FakeField.new(:'X')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect bottom horizonal line' do
    Board.new([
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:'X'), FakeField.new(:'X'), FakeField.new(:'X')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect left vertical line' do
    Board.new([
      [FakeField.new(:'X'), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:'X'), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:'X'), FakeField.new(:' '), FakeField.new(:' ')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect middle vertical line' do
    Board.new([
      [FakeField.new(:' '), FakeField.new(:'X'), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:'X'), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:'X'), FakeField.new(:' ')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect right vertical line' do
    Board.new([
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:'X')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:'X')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:'X')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end


  it 'can detect bottom-up cross line' do
    Board.new([
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:'X')],
      [FakeField.new(:' '), FakeField.new(:'X'), FakeField.new(:' ')],
      [FakeField.new(:'X'), FakeField.new(:' '), FakeField.new(:' ')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

  it 'can detect up-bottom cross line' do
    Board.new([
      [FakeField.new(:'X'), FakeField.new(:' '), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:'X'), FakeField.new(:' ')],
      [FakeField.new(:' '), FakeField.new(:' '), FakeField.new(:'X')]
    ]).contains_filled_line_by?(:'X').must_equal true
  end

end
