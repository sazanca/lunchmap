class AddLikesCountToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :likes_count, :integer
  end
end
