# frozen_string_literal:true

class Visitor < ApplicationRecord
  belongs_to :url
  validates :ip_address, presence: true, format: { with: /\A[0-9 .]*\z/, message: 'must contain only numbers' }
  validates :origin, presence: true
  validates :url_id, presence: true
end

