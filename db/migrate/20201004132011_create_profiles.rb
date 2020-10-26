class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :name
      t.text :ganre
      t.references :user, foreign_key: true
      t.boolean :is_valid, default: true
      t.timestamps
    end
  end
end
