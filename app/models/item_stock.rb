class ItemStock < ApplicationRecord
  belongs_to :item
  validates :stock, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
