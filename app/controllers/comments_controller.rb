class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to "/shops/#{comment.shop.id}" # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:Comment).permit(:text).merge(shop_id: params[:shop_id])
  end
end
