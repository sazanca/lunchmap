class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :map
  belongs_to_active_hash :price
end
