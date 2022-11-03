# frozen_string_literal: true

class Allocation < ApplicationRecord
  belongs_to :block
  belongs_to :week
  belongs_to :technician
end
