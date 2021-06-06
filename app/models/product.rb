class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :listing_person
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_state_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_date_id
    end

    with_options format: { with: /\A[0-9]+\z/ }, length: {minimum: 3, maxinum: 7}, 
      numericality: { only_integer: true, greater_than: 300, less_than: 10000000 } do
      validates :price
    end

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :productstate
  belongs_to :deliverycharge
  belongs_to :prefecture
  belongs_to :deliverydate

end
