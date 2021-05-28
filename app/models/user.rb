class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角(漢字・ひらがな・カタカナ)を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角(カタカナ)を使用してください' } do
    validates :first_name_reading, presence: true
    validates :last_name_reading, presence: true
  end
  
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, format: {with: PASSWORD_REGEX, allow_blank: true, message: 'には半角英字と数字の両方を含めて設定してください' }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX}, allow_blank: true

  validates :encrypted_password, :password, :password_confirmation, length:{minimum:6}

end
