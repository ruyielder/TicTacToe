class DigitsValidator

  def is_valid?(text)
    normalized_text = text.strip
    digits = normalized_text.to_i.to_s
    digits.size == normalized_text.size
  end

end