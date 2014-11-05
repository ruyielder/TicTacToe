class Field
  DEFAULT_VALUE = :' '

  attr_reader :index
  attr_accessor :value

  def initialize(value, index)
    @index = index
    @value = value
  end

  def render
    if @value == DEFAULT_VALUE
      "[#{@index}]"
    else
      "[#{@value}]"
    end
  end

end