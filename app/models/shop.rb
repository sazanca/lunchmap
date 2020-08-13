class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :map
  # belongs_to_active_hash :onetime
  

  belongs_to :user, optional: true
  has_many :comments
  acts_as_taggable
  # acts_as_taggable_on :skills, :interests
  # validates :text, presence: true
end
