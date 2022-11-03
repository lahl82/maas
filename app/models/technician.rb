# frozen_string_literal: true

class Technician < ApplicationRecord
  has_many :availables
  has_many :allocations
end
