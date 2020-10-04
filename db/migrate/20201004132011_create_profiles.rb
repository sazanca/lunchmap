class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :shop
      t.integer :user_id
      t.timestamps
    end
  end
end
