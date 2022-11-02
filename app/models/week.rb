class Week < ApplicationRecord
  has_many :availables
  has_many :allocations
end
