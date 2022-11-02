class Block < ApplicationRecord
  belongs_to :day
  has_many :availables
  has_many :allocations
end
