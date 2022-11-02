class Technician < ApplicationRecord\
  has_many :availables
  has_many :allocations
end
