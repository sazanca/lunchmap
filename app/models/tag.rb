class Tag < ActiveRecord::Base
  belongs_to :shop
  acts_as_taggable
end