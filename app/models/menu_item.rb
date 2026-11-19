class MenuItem < ApplicationRecord
  belongs_to :restaurant

  scope :available, -> { where(available: true) }
  validates :name, presence: true,
            length: { maximum: 100 },
            uniqueness: { scope: :restaurant_id, case_sensitive: false }
  validates :price, presence: true,
            numericality: { greater_than: 0, less_than: 1000 }
  validate :name_not_shouting

  private

  def name_not_shouting
    return unless name?
    if name == name.upcase
      errors.add(:name, "must not be all capitals")
    end
  end
end
