class Like < ApplicationRecord
  belongs_to :shop, counter_cache: :likes_count
  belongs_to :user
end
