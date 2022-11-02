class Day < ApplicationRecord
  belongs_to :contract
  has_many :blocks
end
