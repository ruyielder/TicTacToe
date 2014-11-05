require 'minitest/autorun'
require_relative '../app/field_value_line_enumerator'

class FakeField
  attr_accessor :value

  def initialize(value)
    @value = value
  end

end

describe FieldValueLineEnumerator do

  it 'can enumerate by all lines' do
    enumerator = FieldValueLineEnumerator.new([
      [FakeField.new('A'), FakeField.new('B'), FakeField.new('C')],
      [FakeField.new('D'), FakeField.new('E'), FakeField.new('F')],
      [FakeField.new('G'), FakeField.new('H'), FakeField.new('I')]
    ])
    lines = enumerator.collect.to_set
    # horizontal lines
    lines.must_include ['A', 'B', 'C']
    lines.must_include ['D', 'E', 'F']
    lines.must_include ['G', 'H', 'I']
    # vertical lines
    lines.must_include ['A', 'D', 'G']
    lines.must_include ['B', 'E', 'H']
    lines.must_include ['C', 'F', 'I']
    # cross lines
    lines.must_include ['A', 'E', 'I']
    lines.must_include ['C', 'E', 'G']
  end

  it 'cannot iterate by all lines in many directions' do
    enumerator = FieldValueLineEnumerator.new([
      [FakeField.new('A'), FakeField.new('B'), FakeField.new('C')],
      [FakeField.new('D'), FakeField.new('E'), FakeField.new('F')],
      [FakeField.new('G'), FakeField.new('H'), FakeField.new('I')]
    ])
    lines = enumerator.collect.to_set
    lines.wont_include ['C', 'B', 'A']
    lines.wont_include ['F', 'E', 'D']
    lines.wont_include ['I', 'H', 'G']
    # vertical lines
    lines.wont_include ['G', 'D', 'A']
    lines.wont_include ['H', 'E', 'B']
    lines.wont_include ['I', 'F', 'C']
    # cross lines
    lines.wont_include ['I', 'E', 'A']
    lines.wont_include ['G', 'E', 'C']
  end

end
