class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true

  has_one :map, dependent: :destroy
  accepts_nested_attributes_for :map
  has_many :comments
  acts_as_taggable
  # acts_as_taggable_on :skills, :interests
  # validates :text, presence: true  
end
