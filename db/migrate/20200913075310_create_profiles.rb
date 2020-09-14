class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :ganre
      t.boolean :is_valid, default: true #マッチング機能有効・無効
      t.timestamps
    end
  end
end
