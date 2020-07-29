class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :arrivaltime
      t.string :genre
      t.string :price
      t.timestamps
    end
  end
end
