class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :map
  # belongs_to_active_hash :price この記述があると表示されない何故？
  belongs_to :user
  has_many :comments

  # validates :text, presence: true
end
