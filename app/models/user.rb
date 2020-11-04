class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーションの設定（email,passはデフォルト）
  #新規登録/ユーザー情報
  validates :nickname,           presence: true
  validates :email,              uniqueness: true #DB側は未設定
  validates :encrypted_password, confiration: true, format: { with: /\A[a-z][\d]\Z/}
  
  #新規登録/本人情報確認
  validates :family_name_hira, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\Z/ }
  validates :first_name_hira,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\Z/ }
  validates :family_name_kata, presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :first_name_kata,  presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :day_of_birthday,  presence: true

end