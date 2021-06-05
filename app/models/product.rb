class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :listing_person
    validates :price
    validates :category_id
    validates :product_state_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_date_id
  end

end
