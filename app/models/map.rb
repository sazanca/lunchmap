class Map < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  belongs_to :shop
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
