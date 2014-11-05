class FieldValueLineEnumerator
  include Enumerable

  def initialize(fields)
    @fields = fields
    @row_count = fields.size
    @column_count = fields.size
  end

  def each
    each_horizontal_line do |line|
      yield line
    end

    each_vertical_line do |line|
      yield line
    end

    each_cross_line do |line|
      yield line
    end
  end

private

  def each_horizontal_line
    @fields.each do |horizontal_line_fields|
      values = []
      horizontal_line_fields.each do |field|
        values << field.value
      end
      yield values
    end
  end

  def each_vertical_line
    column_index = 0

    @row_count.times do
      values = []

      @fields.each do |horizontal_line_fields|
        values << horizontal_line_fields[column_index].value
      end

      yield values
      column_index += 1
    end

  end

  def each_cross_line
    yield up_bottom_cross_values
    yield bottom_up_cross_values
  end

  def up_bottom_cross_values
    values = []

    @row_count.times do |index|
      values << @fields[index][index].value
    end

    values
  end

  def bottom_up_cross_values
    values = []

    @row_count.times do |row_index|
      values << @fields[row_index][@column_count - row_index - 1].value
    end

    values
  end


end