class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true

  has_one :map, dependent: :destroy
  accepts_nested_attributes_for :map
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  acts_as_taggable_on :tags
  scope :by_join_date, -> {order("created_at DESC")}
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
