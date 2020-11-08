class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
  has_one  :profile
  has_many :shops
  has_many :comments
  has_many :coupons
  has_many :likes, dependent: :destroy
  has_many :like_shops, through: :likes, source: :shop
  validates :nickname, presence: true,uniqueness: { case_sensitive: :false },length: { minimum: 2, maximum: 20 }
  validates :employee_id, presence: true, uniqueness: { case_sensitive: :false },length: { maximum: 6}
end
