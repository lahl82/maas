# frozen_string_literal: true

class Week < ApplicationRecord
  has_many :availables
  has_many :allocations
end
