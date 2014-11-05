require_relative 'field'

class Board
  DEFAULT_SIZE = 3

  attr_reader :size

  def initialize(fields)
    @fields = fields
    @size = fields.size
  end

  def Board.create_with_default_size
    Board.create_with_size(DEFAULT_SIZE)
  end

  def Board.create_with_size(size)
    fields = []
    size.times do |row_index|
      field_row = []
      size.times do |column_index|
        index = row_index * size + column_index
        field_row << Field.new(Field::DEFAULT_VALUE,  index)
      end
      fields << field_row
    end
    Board.new(fields)
  end

  def Board.create_with_values(values)
    size = values.size
    fields = []
    values.each_with_index do |row, row_index|
      field_row = []
      row.each_with_index do |value, column_index|
        index = row_index * size + column_index
        field_row << Field.new(value,  index)
      end
      fields << field_row
    end
    Board.new(fields)
  end

  def render
    text = ''
    @fields.each do |row|
      row.each do |field|
        text += field.render + ' '
      end
      text += "\n"
    end
    text
  end

end
