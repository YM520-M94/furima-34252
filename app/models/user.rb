class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
  end

  with_options allow_blank: true do
    with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i} do
      validates :password
    end
    with_options  format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_reading
      validates :first_name_reading
    end
  end
end