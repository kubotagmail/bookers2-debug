class SearchesController < ApplicationController
    before_action :authenticate_user!

# 　検索モデル→params[:range]
# 　検索方法→params[:search]
# 　検索ワード→params[:word]
  def search
    @range = params[:range]
# if文を使い、検索モデルUser or Bookで条件分岐させます。
    if @range == "User"
# looksメソッドを使い、検索内容を取得し、変数に代入します。
# 検索方法params[:search]と、検索ワードparams[:word]を参照してデータを検索し、
# 1：インスタンス変数@usersにUserモデル内での検索結果を代入します。
# 2：インスタンス変数@booksにBookモデル内での検索結果を代入します。
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
  
end
