class MenuItem < ApplicationRecord
  belongs_to :restaurant

  scope :available, -> { where(available: true) }
end
