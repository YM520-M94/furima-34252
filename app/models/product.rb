class Product < ApplicationRecord

  belongs_to :user
  has_many_attached :images
  has_one   :purchaser

  with_options presence: true do
    validates :product
    validates :listing_person
    validates :images

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_state_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_date_id
    end

    with_options format: { with: /\A[0-9]+\z/ }, length: {minimum: 3, maxinum: 7}, 
      numericality: { only_integer: true, greater_than: 299, less_than: 10000000 } do
      validates :price
    end

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_date

end
