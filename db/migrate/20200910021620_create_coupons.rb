class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.integer :shop_id
      t.string :discount #割引やサービス内容
      t.string :writing # 但し書き
      t.boolean :is_valid, default: true#クーポン有効性の真偽
      t.integer :limit
      t.references :user
      t.timestamps
    end
  end
end
