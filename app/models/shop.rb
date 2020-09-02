class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :map
  # belongs_to_active_hash :onetime
  accepts_nested_attributes_for :map

  belongs_to :user, optional: true
  has_many :comments
  acts_as_taggable
  # acts_as_taggable_on :skills, :interests
  # validates :text, presence: true
end
