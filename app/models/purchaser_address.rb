class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :product_id, :prefecture_id, :city, :block, :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/ , message: "Phone Number is too long (maximum is 11 characters)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchaser = Purchaser.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
