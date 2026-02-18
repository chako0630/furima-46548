class OrderHistoryShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postscript, :prefecture_id, :city, :house_number, :building, :phone_number
  attr_accessor :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postscript
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :postscript, format: { with: /\A[0-9]{3}-[0-9]{4}\z/,
                                   message: 'is invalid. Include hyphen(-)', allow_blank: true }

  validates :prefecture_id, numericality: { other_than: 1,
                                            message: "can't be blank" }

  validates :phone_number, format: { with: /\A\d{10,11}\z/,
                                     message: 'is invalid', allow_blank: true }
  def save
    # return false unless valid?

    order_history = OrderHistory.create(item_id: item_id, user_id: user_id)

    # return false unless order_history.persisted?

    Shipping.create(postscript: postscript, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building: building, phone_number: phone_number, order_history_id: order_history.id)
  end
end
