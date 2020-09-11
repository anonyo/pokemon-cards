class Card < ApplicationRecord
  validates :name, :rarity, :image_url, presence: true
end
