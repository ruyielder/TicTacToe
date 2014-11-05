require_relative 'client'
require_relative 'digits_validator'
require_relative 'index_validator'

class PlayerClient < Client

  def choice_field(board)
    digits_validator = DigitsValidator.new
    index_validator = IndexValidator.new(board)
    print 'Podaj numer pola jaki chcesz zająć: '

    loop do
      user_value = gets

      unless digits_validator.is_valid? user_value
        puts 'Podana wartość nie jest liczbą, spróbuj jeszcze raz: '
      end

      user_index = user_value.to_i

      unless index_validator.is_valid?(user_index)
        puts 'Podany index jest już zajęty, spróbuj jeszcze raz: '
      end

      return user_index
    end
  end

end