class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  
  validates :password,           presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i},  allow_blank: true
  validates :last_name,          presence: true
  validates :last_name,          format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/ }, allow_blank: true
  validates :first_name,         presence: true
  validates :first_name,         format: {with: /\A[ぁ-んァ-ン一-龠々]+\z/ }, allow_blank: true
  validates :last_name_reading,  presence: true
  validates :last_name_reading,  format: {with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_reading, presence: true
  validates :first_name_reading, format: {with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :birthday,           presence: true

end