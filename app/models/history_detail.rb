class HistoryDetail < ApplicationRecord
  belongs_to :history
  belongs_to :item
  validates :volume, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
