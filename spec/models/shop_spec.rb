require 'rails_helper'

RSpec.describe Shop, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do

    # it "nameがない場合は登録できないこと" do
    #  shop = Shop.new(name: nil, arrivaltime: "3", ganre: "1", price: "900", user_id: "1")
    #  shop.valid?
    #  expect(shop.errors[:name]).to include("を入力してください")
    # end

    # it "arrivaltimeがない場合は登録できないこと" do
    #  shop = Shop.new(name: "恵比寿 天下一 神谷町店", arrivaltime: nil, ganre: "1", price: "900", user_id: "1")
    #  shop.valid?
    #  expect(shop.errors[:arrivaltime]).to include("を入力してください")
    # end

    # it "ganreがない場合は登録できないこと" do
    #  shop = Shop.new(name: "恵比寿 天下一 神谷町店", arrivaltime: "3", ganre: nil, price: "900", user_id: "1")
    #  shop.valid?
    #  expect(shop.errors[:ganre]).to include("を入力してください")
    # end

    # it "arrivaltimeがない場合は登録できないこと" do
    #   shop = Shop.new(name: "恵比寿 天下一 神谷町店", arrivaltime: "3", ganre: "1", price: nil, user_id: "1")
    #   shop.valid?
    #   expect(shop.errors[:price]).to include("を入力してください")
    # end
    # 1
    it "name,arrivaltime,ganre,priceが存在すれば登録できる" do
      shop = build(:shop)
      expect(shop).to be_valid
    end
    # 2
    it " nameがない場合は登録できないこと" do
      shop = build(:shop, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("を入力してください")
    end
    # 3
    it "nameが不適切ワードでは登録不可" do
      shop = build(:shop, name: "アホ")
      shop.valid?
      expect(shop.errors[:name]).to include("に不適切な単語が含まれています")
    end
    # 4
    it "priceが空では登録不可" do
      shop = build(:shop, price: nil)
      shop.valid?
      expect(shop.errors[:price]).to include("を入力してください")
    end
    # 8
    it "arrivaltimeが空では登録不可" do
      shop = build(:shop, arrivaltime: nil)
      shop.valid?
      expect(shop.errors[:arrivaltime]).to include("を入力してください")
    end
    
    # 11
    it "nameの文字数が41文字以上だと登録不可" do
      shop = build(:shop, name: "a" * 41)
      shop.valid?
      expect(shop.errors[:name]).to include("は40文字以内で入力してください")
    end
    # 12
    it "nameの文字数が40字以内だと登録可能" do
      shop = build(:shop, name: "a" * 39)
      expect(shop).to be_valid
    end
    
    # 18
    it "priceが10000000円以上だと登録不可" do
      shop = build(:shop, price: 10000000)
      shop.valid?
      expect(shop.errors[:price]).to include("は一覧にありません")
    end
    # 19
    it "priceが5999円だと登録可能" do
      shop = build(:shop, price: 4999)
      expect(shop).to be_valid
    end
     # 20
     it "priceが299円以下だと登録不可" do
      shop = build(:shop, price: 299)
      shop.valid?
      expect(shop.errors[:price]).to include("は一覧にありません")
    end
    # 21
    it "priceが300円だと登録可能" do
      shop = build(:shop, price: 300)
      expect(shop).to be_valid
    end
  end


  describe '#update' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      shop = build(:shop)
      expect(shop).to be_valid
    end
    # 2
    it " nameがない場合は登録できないこと" do
      shop = build(:shop, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("を入力してください")
    end
    # 3
    it "nameが不適切ワードでは登録不可" do
      shop = build(:shop, name: "アホ")
      shop.valid?
      expect(shop.errors[:name]).to include("に不適切な単語が含まれています")
    end
    # 4
    it "priceが空では登録不可" do
      shop = build(:shop, price: "")
      shop.valid?
      expect(shop.errors[:price]).to include("を入力してください")
    end
   
    # 7
    it "ganreが空では登録不可" do
      shop = build(:shop, ganre: nil)
      shop.valid?
      expect(shop.errors[:ganre]).to include("を入力してください")
    end
    # 8
    it "arrivaltimeが空では登録不可" do
      shop = build(:shop, arrivaltime: "")
      shop.valid?
      expect(shop.errors[:arrivaltime]).to include("を入力してください")
    end
    
    # 11
    it "nameの文字数が41文字以上だと登録不可" do
      shop = build(:shop, name: "a" * 41)
      shop.valid?
      expect(shop.errors[:name]).to include("は40文字以内で入力してください")
    end
    # 12
    it "nameの文字数が40字以内だと登録可能" do
      shop = build(:shop, name: "a" * 39)
      expect(shop).to be_valid
    end
    
    # 18
    it "priceが3000円以上だと登録不可" do
      shop = build(:shop, price: 6000)
      shop.valid?
      expect(shop.errors[:price]).to include("は一覧にありません")
    end

    # 19
    it "priceが5999円だと登録可能" do
      shop = build(:shop, price: 5999)
      expect(shop).to be_valid
    end
     # 20
     it "priceが299円以下だと登録不可" do
      shop = build(:shop, price: 299)
      shop.valid?
      expect(shop.errors[:price]).to include("は一覧にありません")
    end
    # 21
    it "priceが300円だと登録可能" do
      shop = build(:shop, price: 300)
      expect(shop).to be_valid
    end
  end
end
