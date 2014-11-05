require_relative 'client'
require_relative 'digits_validator'
require_relative 'index_validator'

class PlayerClient < Client

  def choice_field(board)
    puts board.render
    get_index_from_user(board)
  end

  def get_index_from_user(board)
    digits_validator = DigitsValidator.new
    index_validator = IndexValidator.new(board)
    print_message 'Podaj numer pola jaki chcesz zająć'

    loop do
      user_value = get_value

      unless digits_validator.is_valid? user_value
        print_message 'Podana wartość nie jest liczbą! Spróbuj jeszcze raz'
        next
      end

      user_index = user_value.to_i

      unless index_validator.is_valid?(user_index)
        print_message 'Podany index jest niedostępny! Spróbuj jeszcze raz'
        next
      end

      return user_index
    end
  end

  def print_message(message)
    puts "[#{message}]"
  end

  def get_value
    print "GRACZ #{@field_value}> "
    gets
  end

end
