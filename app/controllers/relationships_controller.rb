class RelationshipsController < ApplicationController


  # フォローするとき
  def create
    # 用途：フォローを作成
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    # 用途：フォローを削除
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @user = User.find(params[:user_id])
  end

    # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @user = User.find(params[:user_id])
  end

end

