class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :name
      t.text :ganre
      t.integer :user_id
      t.boolean :is_valid, default: true
      t.timestamps
    end
  end
end
