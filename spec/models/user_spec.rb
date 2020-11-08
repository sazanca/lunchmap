require 'rails_helper'

RSpec.describe User, type: :model do 
  #Rspecのみでのテストコード
  # pending "add some examples to (or delete) #{__FILE__}"
  # describe '#create' do
  #   it "nicknameがない場合は登録できないこと" do
  #    user = User.new(nickname: nil, employee_id: "0000we", password: "00000000", password_confirmation: "00000000")
  #    user.valid?
  #    expect(user.errors[:nickname]).to include("を入力してください")
  #   end

  #   it "employee_idがない場合は登録できないこと" do
  #    user = User.new(nickname: "カメ", employee_id: nil, password: "00000000", password_confirmation: "00000000")
  #    user.valid?
  #    expect(user.errors[:employee_id]).to include("を入力してください")
  #   end

  #   it "passwordがない場合は登録できないこと" do
  #     user = User.new(nickname: "カメ", employee_id: "0000we", password: nil, password_confirmation: "00000000")
  #     user.valid?
  #     expect(user.errors[:password]).to include("を入力してください")
  #   end

  #   it "passwordがpassword_confirmationと一致しない場合は登録できないこと" do
  #     user = User.new(nickname: "カメ", employee_id: "0000we", password: "00000000", password_confirmation: "00")
  #     user.valid?
  #     expect(user.errors[:password_confirmation]).to include("を入力してください")
  #   end
  # end

  describe '#create' do
    #factorieBotを使いダミーデータも用いたテストコード
    # 1
    it "すべての項目を入力すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "employee_idがない場合は登録できないこと" do
      user = build(:user, employee_id: nil)
      user.valid?
      expect(user.errors[:employee_id]).to include("を入力してください")
    end

    # 4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 7
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # 8
    it "nicknameが6文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 9
    it " 重複したnicknameが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end
  end
end
