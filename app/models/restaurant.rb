class Restaurant < ApplicationRecord
  has_many :menu_items, dependent: :destroy

  def to_param
    slug
  end
end
