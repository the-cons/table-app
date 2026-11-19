class MenuItem < ApplicationRecord
  belongs_to :restaurant

  scope :available, -> { where(available: true) }
  validates :name, presence: true,
            length: { maximum: 100 },
            uniqueness: { scope: :restaurant_id, case_sensitive: false }
  validates :price, presence: true,
            numericality: { greater_than: 0, less_than: 1000 }
end
