require 'rails_helper'

describe ShopsController, type: :controller do
  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      shop = create(:shop)
      get :new
      expect(assigns(:shop)).to render_template :new
    end
  end

  describe 'GET #show' do
    it "show.html.erbに遷移すること" do
      get :show, params: {  id: shop }
      expect(assigns(:shop)).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "@shopに正しい値が入っていること" do
      shop = create(:shop)
      get :edit, params: { id: shop }
      expect(assigns(:shop)).to eq shop
    end

    it "edit.html.erbに遷移すること" do
      shop = create(:shop)
      get :edit, params: { id: shop }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@shopに正しい値が入っていること" do
      shops = create_list(:shop, 3) 
      get :index
      # expect(assigns(:shops)).to match(shops)
      expect(assigns(:shops)).to match(shops.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "index.html.erbに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe '#create' do
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }

    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存に成功した場合' do
        subject {
          post :create,
          params: params
        }

        it 'shopを保存すること' do
          expect{ subject }.to change(Shop, :count).by(1)
        end

        it 'shop_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(shop_path)
        end
      end

      context '保存に失敗した場合' do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'messageを保存しないこと' do
          expect{ subject }.not_to change(Message, :count)
        end

        it 'index.html.hamlに遷移すること' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'ログインしていない場合' do

      it 'new_user_session_pathにリダイレクトすること' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end