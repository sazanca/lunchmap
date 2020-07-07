class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.float :latitude
      t.float :longitude
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
