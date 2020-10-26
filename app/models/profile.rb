class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, length: { maximum: 40 }
end
