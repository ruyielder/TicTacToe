require_relative 'board'

class Game

  def initialize(board, clients)
    @board = board
    @clients = clients
  end

  def run
    winner_field_value = get_winner_field_value
    display_result(winner_field_value)
  end

  def get_winner_field_value
    @clients.cycle do |client|
      index = client.choice_field(@board)
      @board.take_field(index, client.field_value)
      if @board.contains_filled_line_by? client.field_value
        return client.field_value
      elsif @board.is_full_filled?
        return nil
      end
    end
  end

  def display_result(winner_field_value)
    if winner_field_value.nil?
      puts 'REMIS'
    else
      puts "WYGRAŁ GRACZ #{winner_field_value}, GRATULACJE!!!"
    end
  end

end
