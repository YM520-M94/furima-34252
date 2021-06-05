class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :productstate
  belongs_to :deliverycharge
  belongs_to :prefecture
  belongs_to :deliverydate

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
