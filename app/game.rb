require_relative 'board'

class Game

  def initialize(board, clients)
    @board = board
    @clients = clients
  end

  def run
    @clients.cycle do |client|
      index = client.choice_field(@board)
      @board.take_field(index, client.field_value)
    end
  end

end
