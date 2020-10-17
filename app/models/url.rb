# Frozen_string_literal:true

require 'securerandom'

class Url < ApplicationRecord
  URL_REGEXP = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  validates :original_url, presence: true, length: { minimum: 10 },format: { 
    with: URL_REGEXP,
    multiline: true,
    message: 'You provided invalid URL'
    }
  before_save :set_val

  def set_val
    # binding.pry
    self.short_url = check_and_return_unique_value
    self.is_expire = false
  end

  private

  def check_and_return_unique_value
    @value = generate_randam_value
    if self.class.exists?(short_url: @value)
      check_and_return_unique_value
    else
      @value
    end
  end

  def generate_randam_value
    SecureRandom.alphanumeric(5)
  end
end
