require 'minitest/autorun'
require_relative '../app/digits_validator'


describe DigitsValidator do

  it 'can be created without arguments' do
    DigitsValidator.new.must_be_instance_of DigitsValidator
  end

  it 'can validate empty string' do
    DigitsValidator.new.is_valid?('').must_equal false
  end

  it 'can validate incorrect value' do
    DigitsValidator.new.is_valid?('@#@KO').must_equal false
  end

  it 'can validate part incorrect value' do
    DigitsValidator.new.is_valid?('34AG').must_equal false
  end

  it 'can validate correct value' do
    DigitsValidator.new.is_valid?('34').must_equal true
  end

  it 'can validate correct value with white characters' do
    DigitsValidator.new.is_valid?('  34  ').must_equal true
  end

end
