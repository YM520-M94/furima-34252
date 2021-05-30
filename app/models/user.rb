class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  
  validates :email,              presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true
  validates :password,           presence: true, format: {with: /\A[a-z\d]{6,}+\z/i},                   allow_blank: true
  validates :last_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/ },               allow_blank: true
  validates :first_name,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/ },               allow_blank: true
  validates :last_name_reading,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ },                    allow_blank: true
  validates :first_name_reading, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ },                    allow_blank: true
  validates :birthday,           presence: true

end