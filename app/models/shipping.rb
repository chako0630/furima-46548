class Shipping < ApplicationRecord
  belongs_to :order_history

  validates :postscript, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
end
