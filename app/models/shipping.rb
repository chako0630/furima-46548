class Shipping < ApplicationRecord
  belongs_to :order_history

  validates :postscript, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
end
