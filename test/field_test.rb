require 'minitest/autorun'
require_relative '../app/field'

describe Field do

  it 'can be created with index and value' do
    Field.new(Field::DEFAULT_VALUE, 0).must_be_instance_of Field
  end

  it 'has got a value accessor' do
    field = Field.new(Field::DEFAULT_VALUE, 0)
    field.value = 10
    field.value.must_equal 10
  end

  it 'can be rendered with index if value is default' do
    field = Field.new(Field::DEFAULT_VALUE, 8)
    field.render.must_equal '[8]'
  end

  it 'can be rendered with value if value is not default' do
    field = Field.new(:'X', 8)
    field.render.must_equal '[X]'
  end

end
