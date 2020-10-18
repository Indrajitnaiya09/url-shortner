# frozen_string_literal:true

class Visitor < ApplicationRecord
  belongs_to :url
  validates :ip_address, presence: true
  validates :origin, presence: true
  validates :url_id, presence: true
end

