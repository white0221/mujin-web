class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :value, presence: true
  validates :aruco_id, uniqueness: true
end
