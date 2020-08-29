class Map < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address #latitude: :lat, longitude: :lon
  after_validation :geocode, if: :address_changed?
  belongs_to :shop, dependent: :destroy 
  accepts_nested_attributes_for :shop

end
